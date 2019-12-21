//---------------------------------------------------------------------------//
// Copyright (c) 2017-2019 Ismael Gutiérrez González. All rights reserved.
//
// This file is part of the Rusted PackFile Manager (RPFM) project,
// which can be found here: https://github.com/Frodo45127/rpfm.
//
// This file is licensed under the MIT license, which can be found here:
// https://github.com/Frodo45127/rpfm/blob/master/LICENSE.
//---------------------------------------------------------------------------//


//! This module contains the different commands RPFM-CLI can execute.

use clap::ArgMatches;

use rpfm_error::{ErrorKind, Result};

use crate::config::Config;

mod table;
mod packfile;
mod schema;

//---------------------------------------------------------------------------//
// 								Command Variants
//---------------------------------------------------------------------------//

/// This function triggers functions that require the `PackFile` command.
pub fn command_packfile(config: &Config, matches: &ArgMatches, packfile: Option<&str>) -> Result<()> {
    match packfile {
        Some(packfile_path) => {

            // Add Files to PackFile.
		    if matches.is_present("add-files") {
				match matches.values_of("add-files") {
					Some(mut values) => {
                        let destination_path = values.nth(0).unwrap();
                        let packed_file_paths = values.enumerate().filter(|(x, _)| x == &0).map(|(_, y)| y).collect::<Vec<&str>>();
                        packfile::add_files(&config, packfile_path, &packed_file_paths, destination_path)
                    },
					None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
				}
		    }

		    else if matches.is_present("add-folders") {
				match matches.values_of("add-folders") {
					Some(mut values) => {
                        let destination_path = values.nth(0).unwrap();
                        let folder_paths = values.enumerate().filter(|(x, _)| x == &0).map(|(_, y)| y).collect::<Vec<&str>>();
                        packfile::add_folders(&config, packfile_path, &folder_paths, destination_path)
                    },
					None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
				}
		    }

		    else if matches.is_present("delete-files") {
				match matches.values_of("delete-files") {
					Some(values) => {
                        let packed_file_paths = values.map(|y| y).collect::<Vec<&str>>();
                        packfile::delete_files(&config, packfile_path, &packed_file_paths)
                    },
					None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
				}
		    }

		    else if matches.is_present("delete-folders") {
				match matches.values_of("delete-folders") {
					Some(values) => {
                        let folder_paths = values.map(|y| y).collect::<Vec<&str>>();
                        packfile::delete_folders(&config, packfile_path, &folder_paths)
                    },
					None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
				}
		    }

			else if matches.is_present("list") { packfile::list_packfile_contents(&config, packfile_path) }
			else { Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))? }
        },
        None => Err(ErrorKind::NoHTMLError("No PackFile provided.".to_owned()))?,
    }
}

/// This function triggers functions that require the `Table` command.
pub fn command_table(config: &Config, matches: &ArgMatches) -> Result<()> {
    if matches.is_present("import") {
		match matches.values_of("import") {
			Some(mut values) => table::import_tsv(&config, values.nth(0).unwrap(), values.nth(0)),
			None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
		}
    }

    else if matches.is_present("export") {
		match matches.values_of("export") {
			Some(mut values) => table::export_tsv(&config, values.nth(0).unwrap(), values.nth(0)),
			None => Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))?
		}
    }

	//else if matches.is_present("export") { packfile::list_packfile_contents(config, packfile_path) }
	else { Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))? }
}

/// This function triggers functions that require the `Schema` command.
pub fn command_schema(config: &Config, matches: &ArgMatches) -> Result<()> {
    if matches.is_present("update") {
		schema::update(config)
    }

	else { Err(ErrorKind::NoHTMLError("No valid argument provided.".to_owned()))? }
}
