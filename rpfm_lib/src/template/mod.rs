//---------------------------------------------------------------------------//
// Copyright (c) 2017-2020 Ismael Gutiérrez González. All rights reserved.
//
// This file is part of the Rusted PackFile Manager (RPFM) project,
// which can be found here: https://github.com/Frodo45127/rpfm.
//
// This file is licensed under the MIT license, which can be found here:
// https://github.com/Frodo45127/rpfm/blob/master/LICENSE.
//---------------------------------------------------------------------------//

/*!
Module with all the code to deal with mod templates.

Templates are a way of bootstraping mods in a few clicks. The way this works is:
- Each template has some general data (name, author,...) about the template itself, some parametrizable data, and some hardcoded data.
- When a template is loaded, the user fills the "Options" (sections of the Template to be applied) and "Parameters" (data that gets personalized to the user's need).
- The template then prepares the parametrized data, and applies itself over the open PackFile.
!*/

use git2::Repository;

use serde_json::de::from_reader;
use serde_derive::{Serialize, Deserialize};

use std::fs::{DirBuilder, File};
use std::io::{BufReader, Write};

use rpfm_error::{ErrorKind, Result};

use crate::common::*;
use crate::dependencies::Dependencies;
use crate::packfile::{PathType, PackFile, packedfile::PackedFile};
use crate::packedfile::PackedFileType;
use crate::packedfile::text::TextType;
use crate::SCHEMA;
use crate::schema::APIResponseSchema;
use self::{asset::Asset, template_db::TemplateDB, template_loc::TemplateLoc};

pub const TEMPLATE_FOLDER: &str = "templates";
pub const DEFINITIONS_FOLDER: &str = "definitions";
pub const ASSETS_FOLDER: &str = "assets";
pub const CUSTOM_TEMPLATE_FOLDER: &str = "templates_custom";

pub const TEMPLATE_REPO: &str = "https://github.com/Frodo45127/rpfm-templates";
pub const REMOTE: &str = "origin";
pub const BRANCH: &str = "master";

mod asset;
mod template_db;
mod template_loc;

//---------------------------------------------------------------------------//
//                              Enum & Structs
//---------------------------------------------------------------------------//

/// This struct represents a Template File in memory.
#[derive(Clone, PartialEq, Eq, Debug, Default, Serialize, Deserialize)]
pub struct Template {

    /// It stores the structural version of the Table.
    version: u16,
    pub author: String,
    name: String,
    pub description: String,

    /// List of params this template requires the user to fill.
    ///
    /// This means: (Display Name, Key)
    pub params: Vec<(String, String)>,

    /// List of options this PackFile can have.
    ///
    /// This means: (Display Name, Key)
    options: Vec<(String, String)>,

    /// The list of DB tables that should be created using this template.
    dbs: Vec<TemplateDB>,

    /// The list of Loc tables that should be created using this template.
    locs: Vec<TemplateLoc>,

    /// The list of binary assets that should be added to the PackFile using this template.
    assets: Vec<Asset>,
}

/// This struct is a common field for table templates. It's here so it can be shared between table types.
#[derive(Clone, PartialEq, Eq, Debug, Default, Serialize, Deserialize)]
struct TemplateField {

    /// Options required for the field to be used in the template.
    required_options: Vec<String>,

    /// Name of the field in the schema (A.K.A column name).
    field_name: String,

    /// Value the field will have.
    field_value: String,
}

//---------------------------------------------------------------------------//
//                       Enum & Structs Implementations
//---------------------------------------------------------------------------//

/// Implementation of `Template`.
impl Template {

    /// This function applyes a `Template` into the currently open PackFile, if there is one open.
    pub fn apply_template(&mut self, options: &[bool], params: &[String], pack_file: &mut PackFile, dependencies: &Dependencies, is_custom: bool) -> Result<Vec<Vec<String>>> {

        // "Parse" the options list into keys, so we know what options are enabled.
        let options = self.options.iter().zip(options.iter()).filter_map(|x| if *x.1 { Some(x.0.1.to_owned()) } else { None }).collect::<Vec<String>>();

        // If there is no PackFile open, stop.
        if pack_file.get_file_name().is_empty() {
            return Err(ErrorKind::PackFileIsNotAFile.into());
        }

        // First, deal with all the params.
        for (key, value) in self.params.iter().zip(params.iter()) {
            for db in &mut self.dbs {
                db.replace_params(&key.1, value);
            }

            for loc in &mut self.locs {
                loc.replace_params(&key.1, value);
            }

            for asset in &mut self.assets {
                asset.replace_params(&key.1, value);
            }
        }

        // If ANY of the paths has an empty item, stop.
        if self.dbs.iter().any(|x| x.name.is_empty()) ||
            self.locs.iter().any(|x| x.name.is_empty()) ||
            self.assets.iter().any(|x| x.packed_file_path.contains("//") || x.packed_file_path.ends_with('/')) {
            return Err(ErrorKind::InvalidPathsInTemplate.into());
        }


        // Then, just process each section. In case of collision, we try to append the new data at the end of the file.
        match &*SCHEMA.read().unwrap() {
            Some(schema) => {
                let mut paths = vec![];
                let mut packed_files = vec![];

                // First, the db tables.
                for db in &self.dbs {
                    if db.has_required_options(&options) {
                        let packed_file = db.apply_to_packfile(&options, pack_file, schema, dependencies)?;

                        paths.push(packed_file.get_path().to_vec());
                        packed_files.push(packed_file);
                    }
                }

                // Next, the loc tables.
                for loc in &self.locs {
                    if loc.has_required_options(&options) {
                        let packed_file = loc.apply_to_packfile(&options, pack_file, schema)?;

                        paths.push(packed_file.get_path().to_vec());
                        packed_files.push(packed_file);
                    }
                }

                // And finally, the custom assets.
                let mut folder_name = self.name.to_owned();
                folder_name.pop();
                folder_name.pop();
                folder_name.pop();
                folder_name.pop();
                folder_name.pop();
                let assets_folder = if is_custom { get_custom_template_assets_path()?.join(&folder_name) }
                else { get_template_assets_path()?.join(&folder_name) };

                for asset in &self.assets {
                    if asset.has_required_options(&options) {
                        let path = assets_folder.join(&asset.file_path);
                        let packed_file_path = asset.packed_file_path.split('/').map(|x| x.to_owned()).collect::<Vec<String>>();
                        let packed_file = PackedFile::new_from_file(&path, &packed_file_path)?;

                        paths.push(packed_file_path);
                        packed_files.push(packed_file);
                    }
                }

                // Then, if nothing broke, add the new PackedFiles to the PackFile.
                pack_file.add_packed_files(&packed_files.iter().collect::<Vec<&PackedFile>>(), true)?;
                Ok(paths)
            }
            None => Err(ErrorKind::SchemaNotFound.into()),
        }
    }

    /// Function to generate a Template from the currently open PackedFile.
    pub fn save_from_packfile(
        pack_file: &mut PackFile,
        template_name: &str,
        template_author: &str,
        template_description: &str,
        options: &[(String, String)],
        params: &[(String, String)]
    ) -> Result<()> {

        // If we have no PackedFiles, return an error.
        if pack_file.get_packedfiles_list().is_empty() {
            return Err(ErrorKind::Generic.into());
        }

        // DB Importing.
        let tables = pack_file.get_packed_files_by_type(PackedFileType::DB, false);
        let dbs = tables.iter().map(|table| TemplateDB::new_from_packedfile(&table).unwrap()).collect::<Vec<TemplateDB>>();

        // Loc Importing.
        let tables = pack_file.get_packed_files_by_type(PackedFileType::Loc, false);
        let locs = tables.iter().map(|table| TemplateLoc::new_from_packedfile(&table).unwrap()).collect::<Vec<TemplateLoc>>();

        // Raw Assets Importing.
        let raw_types = vec![
            PackedFileType::Anim,
            PackedFileType::AnimFragment,
            PackedFileType::AnimPack,
            PackedFileType::AnimTable,
            PackedFileType::CaVp8,
            PackedFileType::CEO,
            PackedFileType::DependencyPackFilesList,
            PackedFileType::Image,
            PackedFileType::GroupFormations,
            PackedFileType::MatchedCombat,
            PackedFileType::RigidModel,
            PackedFileType::StarPos,
            PackedFileType::PackFileSettings,
            PackedFileType::Unknown,
            PackedFileType::Text(TextType::Plain)
        ];

        let assets_path = get_custom_template_assets_path()?.join(template_name);
        DirBuilder::new().recursive(true).create(&assets_path)?;

        let assets_packed_files = pack_file.get_ref_packed_files_by_types(&raw_types, false);
        let assets_path_types = assets_packed_files.iter().map(|x| PathType::File(x.get_path().to_vec())).collect::<Vec<PathType>>();
        let assets = assets_packed_files.iter().map(|x| Asset::new_from_packedfile(x)).collect::<Vec<Asset>>();

        pack_file.extract_packed_files_by_type(&assets_path_types, &assets_path)?;

        let mut template = Self {
            version: 0,
            author: template_author.to_owned(),
            name: template_name.to_owned(),
            description: template_description.to_owned(),

            params: params.to_vec(),
            options: options.to_vec(),

            dbs,
            locs,
            assets,
        };

        template.save(template_name)
    }

    /// This function returns the list of options available for the provided Template.
    pub fn get_options(&self) -> &[(String, String)] {
        &self.options
    }

    /// This function loads a `Template` to memory.
    pub fn load(template: &str, is_custom: bool) -> Result<Self> {
        let mut file_path_official = get_template_definitions_path()?;
        let mut file_path_custom = get_custom_template_definitions_path()?;
        file_path_official.push(template);
        file_path_custom.push(template);

        let file = if is_custom { BufReader::new(File::open(&file_path_custom)?) }
        else { BufReader::new(File::open(&file_path_official)?) };

        let mut template_loaded: Self = from_reader(file)?;
        template_loaded.name = template.to_owned();
        Ok(template_loaded)
    }

    /// This function saves a `Template` from memory to a file in the `template/` folder.
    pub fn save(&mut self, template: &str) -> Result<()> {
        let mut file_path = get_custom_template_definitions_path()?;

        // Make sure the path exists to avoid problems with updating templates.
        DirBuilder::new().recursive(true).create(&file_path)?;

        file_path.push(format!("{}.json", template));
        let mut file = File::create(&file_path)?;
        file.write_all(serde_json::to_string_pretty(&self)?.as_bytes())?;
        Ok(())
    }

    /// This function downloads the latest revision of the template repository.
    pub fn update() -> Result<()> {
        let template_path = get_template_base_path()?;
        let repo = match Repository::open(&template_path) {
            Ok(repo) => repo,
            Err(_) => {
                DirBuilder::new().recursive(true).create(&template_path)?;
                match Repository::clone(TEMPLATE_REPO, &template_path) {
                    Ok(repo) => repo,
                    Err(_) => return Err(ErrorKind::DownloadTemplatesError.into()),
                }
            }
        };

        // git2-rs does not support pull. Instead, we kinda force a fast-forward. Made in StackOverflow.
        repo.find_remote(REMOTE)?.fetch(&[BRANCH], None, None)?;
        let fetch_head = repo.find_reference("FETCH_HEAD")?;
        let fetch_commit = repo.reference_to_annotated_commit(&fetch_head)?;
        let analysis = repo.merge_analysis(&[&fetch_commit])?;

        if analysis.0.is_up_to_date() {
            Err(ErrorKind::AlreadyUpdatedTemplatesError.into())
        }

        else if analysis.0.is_fast_forward() {
            let refname = format!("refs/heads/{}", BRANCH);
            let mut reference = repo.find_reference(&refname)?;
            reference.set_target(fetch_commit.id(), "Fast-Forward")?;
            repo.set_head(&refname)?;
            repo.checkout_head(Some(git2::build::CheckoutBuilder::default().force())).map_err(From::from)
        }

        else {
            Err(ErrorKind::DownloadTemplatesError.into())
        }
    }

    /// This function checks if there is a new template update in the template repo.
    pub fn check_update() -> Result<APIResponseSchema> {
        let template_path = get_template_base_path()?;
        let repo = match Repository::open(&template_path) {
            Ok(repo) => repo,

            // If this fails, it means we either we don´t have the templates downloaded, or we have the old ones downloaded.
            Err(_) => return Ok(APIResponseSchema::NoLocalFiles),
        };

        // git2-rs does not support pull. Instead, we kinda force a fast-forward. Made in StackOverflow.
        repo.find_remote(REMOTE)?.fetch(&[BRANCH], None, None)?;
        let fetch_head = repo.find_reference("FETCH_HEAD")?;
        let fetch_commit = repo.reference_to_annotated_commit(&fetch_head)?;
        let analysis = repo.merge_analysis(&[&fetch_commit])?;

        if analysis.0.is_up_to_date() {
            Ok(APIResponseSchema::NoUpdate)
        }

        else if analysis.0.is_fast_forward() {
            Ok(APIResponseSchema::NewUpdate)
        }

        else {
            Err(ErrorKind::TemplateUpdateError.into())
        }
    }
}

/// Implementation of TemplateField.
impl TemplateField {

    /// This function builds a new TemplateField from the data provided.
    pub fn new(required_options: &[String], field_name: &str, field_value: &str) -> Self {
        Self {
            required_options: required_options.to_vec(),
            field_name: field_name.to_owned(),
            field_value: field_value.to_owned(),
        }
    }

    /// This function returns the column name for this field.
    pub fn get_field_name(&self) -> &str {
        &self.field_name
    }

    /// This function returns the value for this field.
    pub fn get_field_value(&self) -> &str {
        &self.field_value
    }

    /// This function returns the value for this field.
    pub fn get_ref_mut_field_value(&mut self) -> &mut String {
        &mut self.field_value
    }

    /// This function is used to check if we have all the options required to use this field in the template.
    pub fn has_required_options(&self, options: &[String]) -> bool {
        self.required_options.is_empty() || self.required_options.iter().all(|x| options.contains(x))
    }
}
