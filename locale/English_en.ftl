### Localization for RPFM-UI - English

## General Localization

gen_loc_accept = Accept
gen_loc_create = Create
gen_loc_packedfile = PackedFile
gen_loc_packfile = PackFile
gen_loc_packfile_contents = PackFile Contents

gen_loc_column = Column
gen_loc_row = Row
gen_loc_match = Match
gen_loc_length = Length

trololol = queek_headtaker_yes_yes

### mod.rs localization

## Menu Bar

menu_bar_packfile = &PackFile
menu_bar_view = &View
menu_bar_mymod = &MyMod
menu_bar_game_selected = &Game Selected
menu_bar_special_stuff = &Special Stuff
menu_bar_templates = Templates
menu_bar_about = &About
menu_bar_debug = &Debug

## PackFile Menu

new_packfile = &New PackFile
open_packfile = &Open PackFile
save_packfile = &Save PackFile
save_packfile_as = Save PackFile &As...
packfile_install = &Install
packfile_uninstall = &Uninstall
load_all_ca_packfiles = &Load All CA PackFiles
preferences = &Preferences
quit = &Quit
open_recent = Open Recent
open_from_content = Open From Content
open_from_data = Open From Data
change_packfile_type = &Change PackFile Type

## Change Packfile Type Menu

packfile_type_boot = &Boot
packfile_type_release = &Release
packfile_type_patch = &Patch
packfile_type_mod = &Mod
packfile_type_movie = Mo&vie
packfile_type_other = &Other

change_packfile_type_header_is_extended = &Header Is Extended
change_packfile_type_index_includes_timestamp = &Index Includes Timestamp
change_packfile_type_index_is_encrypted = Index Is &Encrypted
change_packfile_type_data_is_encrypted = &Data Is Encrypted
change_packfile_type_data_is_compressed = Data Is &Compressed

## MyMod Menu

mymod_new = &New MyMod
mymod_delete_selected = &Delete Selected MyMod
mymod_import = Import
mymod_export = Export

mymod_name = Name of the Mod:
mymod_name_default = For example: one_ring_for_me
mymod_game = Game of the Mod:

## View Menu

view_toggle_packfile_contents = Toggle &PackFile Contents
view_toggle_global_search_panel = Toggle Global Search Window
view_toggle_diagnostics_panel = Toggle Diagnostics Window

## Game Selected Menu

game_selected_launch_game = Launch Game Selected
game_selected_open_game_data_folder = Open Game's Data Folder
game_selected_open_game_assembly_kit_folder = Open Game's Assembly Kit Folder
game_selected_open_config_folder = Open RPFM's Config Folder

## Special Stuff

special_stuff_optimize_packfile = &Optimize PackFile
special_stuff_generate_pak_file = &Generate PAK File
special_stuff_patch_siege_ai = &Patch Siege AI
special_stuff_select_ak_folder = Select Assembly Kit's Folder
special_stuff_select_raw_db_folder = Select Raw DB Folder

## Templates Menu
templates_open_custom_templates_folder = Open Custom Template Folder
templates_open_official_templates_folder = Open Official Template Folder
templates_save_packfile_to_template = Save PackFile to Template
templates_load_custom_template_to_packfile = Load Custom Templates to PackFile
templates_load_official_template_to_packfile = Load Official Templates to PackFile

## About Menu

about_about_qt = About &Qt
about_about_rpfm = About RPFM
about_open_manual = &Open Manual
about_patreon_link = &Support me on Patreon
about_check_updates = &Check Updates
about_check_schema_updates = Check Schema &Updates

## Debug Menu

update_current_schema_from_asskit = Update currently loaded Schema with Assembly Kit
generate_schema_diff = Generate Schema Diff

### app_ui_extra.rs localisation

## Update Stuff

update_checker = Update Checker
update_schema_checker = Update Schema Checker
update_template_checker = Update Template Checker
update_searching = Searching for updates...
update_button = &Update
update_in_prog = <p>Downloading updates, don't close this window...</p> <p>This may take a while.</p>
update_no_local_schema = <p>No local schemas found. Do you want to download the lastest ones?</p><p><b>NOTE:</b> Schemas are needed for opening tables, locs and other PackedFiles. No schemas means you cannot edit tables.</p>
update_no_local_template = <p>No local templates found. Do you want to download the lastest ones?</p><p><b>NOTE:</b> Templates are useful to bootstraps mods in a few clicks.</p>

## Folder Dialogues

new_folder_default = new_folder
new_folder = New Folder

## PackedFile Dialogues

new_file_default = new_file
new_db_file = New DB PackedFile
new_loc_file = New Loc PackedFile
new_txt_file = New Text PackedFile
new_animpack_file = New AnimPack
new_packedfile_name = New PackedFile's Name

packedfile_filter = Type here to filter the tables of the list. Works with Regex too!

merge_tables = Merge Tables
merge_tables_new_name = Write the name of the new file here.
merge_tables_delete_option = Delete original tables

## External FileDialog

open_packfiles = Open PackFiles

### tips.rs

## PackFile menu tips

tt_packfile_new_packfile = Creates a new PackFile and open it. Remember to save it later if you want to keep it!
tt_packfile_open_packfile = Open an existing PackFile, or multiple existing PackFiles into one.
tt_packfile_save_packfile = Save the changes made in the currently open PackFile to disk.
tt_packfile_save_packfile_as = Save the currently open PackFile as a new PackFile, instead of overwriting the original one.
tt_packfile_install = Copy the currently selected PackFile into the data folder of the GameSelected.
tt_packfile_uninstall = Removes the currently selected PackFile from the data folder of the GameSelected.
tt_packfile_load_all_ca_packfiles = Try to load every PackedFile from every vanilla PackFile of the selected game into RPFM at the same time, using lazy-loading to load the PackedFiles. Keep in mind that if you try to save it, your PC may die.
tt_packfile_preferences = Open the Preferences/Settings dialog.
tt_packfile_quit = Exit the Program.

tt_change_packfile_type_boot = Changes the PackFile's Type to Boot. You should never use it.
tt_change_packfile_type_release = Changes the PackFile's Type to Release. You should never use it.
tt_change_packfile_type_patch = Changes the PackFile's Type to Patch. You should never use it.
tt_change_packfile_type_mod = Changes the PackFile's Type to Mod. You should use this for mods that should show up in the Mod Manager.
tt_change_packfile_type_movie = Changes the PackFile's Type to Movie. You should use this for mods that'll always be active, and will not show up in the Mod Manager.
tt_change_packfile_type_other = Changes the PackFile's Type to Other. This is for PackFiles without write support, so you should never use it.

tt_change_packfile_type_data_is_encrypted = If checked, the data of the PackedFiles in this PackFile is encrypted. Saving this kind of PackFiles is NOT SUPPORTED.
tt_change_packfile_type_index_includes_timestamp = If checked, the PackedFile Index of this PackFile includes the 'Last Modified' date of every PackedFile. Note that PackFiles with this enabled WILL NOT SHOW UP as mods in the official launcher.
tt_change_packfile_type_index_is_encrypted = If checked, the PackedFile Index of this PackFile is encrypted. Saving this kind of PackFiles is NOT SUPPORTED.
tt_change_packfile_type_header_is_extended = If checked, the header of this PackFile is extended by 20 bytes. Only seen in Arena PackFiles with encryption. Saving this kind of PackFiles is NOT SUPPORTED.
tt_change_packfile_type_data_is_compressed = If checked, the data of each PackedFile in the open PackFile will be compressed on save. If you want to decompress a PackFile, disable this, then save it.

## MyMod menu tips

tt_mymod_new = Open the dialog to create a new MyMod.
tt_mymod_delete_selected = Delete the currently selected MyMod.

tt_mymod_import = Move all of the contents of the MyMod folder into the .pack file. If any files have been removed in the MyMod folder, they will be deleted in the .pack file.
tt_mymod_export = Move all of the contents from the .pack file into the MyMod folder. If any files have been removed from the .pack, they will be deleted in the MyMod folder.

## GameSelected menu tips

tt_game_selected_launch_game = Tries to launch the currently selected game on steam.
tt_game_selected_open_game_data_folder = Tries to open the currently selected game's Data folder (if exists) in the default file manager.
tt_game_selected_open_game_assembly_kit_folder = Tries to open the currently selected game's Assembly Kit folder (if exists) in the default file manager.
tt_game_selected_open_config_folder = Tries to open RPFM's config folder, where the config/schemas/ctd reports are.

tt_game_selected_troy = Sets 'TW:Troy' as 'Game Selected'.
tt_game_selected_three_kingdoms = Sets 'TW:Three Kingdoms' as 'Game Selected'.
tt_game_selected_warhammer_2 = Sets 'TW:Warhammer 2' as 'Game Selected'.
tt_game_selected_warhammer = Sets 'TW:Warhammer' as 'Game Selected'.
tt_game_selected_thrones_of_britannia = Sets 'TW: Thrones of Britannia' as 'Game Selected'.
tt_game_selected_attila = Sets 'TW:Attila' as 'Game Selected'.
tt_game_selected_rome_2 = Sets 'TW:Rome 2' as 'Game Selected'.
tt_game_selected_shogun_2 = Sets 'TW:Shogun 2' as 'Game Selected'.
tt_game_selected_napoleon = Sets 'TW:Napoleon' as 'Game Selected'.
tt_game_selected_empire = Sets 'TW:Empire' as 'Game Selected'.
tt_game_selected_arena = Sets 'TW:Arena' as 'Game Selected'.

## Special Stuff menu tips

tt_generate_pak_file = Generates a PAK File (Processed Assembly Kit File) for the game selected, to help with dependency checking.
tt_optimize_packfile = Check and remove any data in DB Tables and Locs (Locs only for english users) that is unchanged from the base game. That means your mod will only contain the stuff you change, avoiding incompatibilities with other mods.
tt_patch_siege_ai = Patch & Clean an exported map's PackFile. It fixes the Siege AI (if it has it) and remove useless xml files that bloat the PackFile, reducing his size.

## About menu tips

tt_about_about_qt = Info about Qt, the UI Toolkit used to make this program.
tt_about_about_rpfm = Info about RPFM.
tt_about_open_manual = Open RPFM's Manual in a PDF Reader.
tt_about_patreon_link = Open RPFM's Patreon page. Even if you are not interested in becoming a Patron, check it out. I post info about the next updates and in-dev features from time to time.
tt_about_check_updates = Checks if there is any update available for RPFM.
tt_about_check_schema_updates = Checks if there is any update available for the schemas. This is what you have to use after a game's patch.

### global_search_ui/mod.rs

global_search = Global Search
global_search_info = Search Info
global_search_search = Search
global_search_replace = Replace
global_search_replace_all = Replace All
global_search_clear = Clear
global_search_case_sensitive = Case Sensitive
global_search_use_regex = Use Regex
global_search_search_on = Search On

global_search_all = All
global_search_db = DB
global_search_loc = LOC
global_search_txt = Text
global_search_schemas = Schemas

## Filter Dialogues

global_search_db_matches = DB Matches
global_search_loc_matches = Loc Matches
global_search_txt_matches = Text Matches
global_search_schema_matches = Schema Matches

global_search_match_packedfile_column = PackedFile/Column
global_search_match_packedfile_text = PackedFile/Text

global_search_versioned_file = VersionFiled (Type, Name)/Column Name
global_search_definition_version = Definition Version
global_search_column_index = Column Index

## tips

tt_global_search_use_regex_checkbox = Enable search using Regex. Keep in mind that RPFM will fallback to a normal pattern search if the provided Regex is invalid.
tt_global_search_case_sensitive_checkbox = Enable case sensitive search. Pretty self-explanatory.
tt_global_search_search_on_all_checkbox = Include all searchable PackedFiles/Schemas on the search.
tt_global_search_search_on_dbs_checkbox = Include DB Tables on the search.
tt_global_search_search_on_locs_checkbox = Include LOC Tables on the search.
tt_global_search_search_on_texts_checkbox = Include any kind of Text PackedFile on the search.
tt_global_search_search_on_schemas_checkbox = Include the currently loaded Schema on the search.

### Open PackedFile Dialog

open_packedfile_dialog_1 = Are you sure?
open_packedfile_dialog_2 = One or more of the PackedFiles you want to replace/delete is open. Are you sure you want to do it? Hitting yes will close it.

### TreeView Text/Filter

treeview_aai = AaI
treeview_autoexpand = Auto-Expand Matches
treeview_expand_all = &Expand All
treeview_collapse_all = &Collapse All

### TreeView Tips

tt_context_menu_add_file = Add one or more files to the currently open PackFile. Existing files are not overwriten!
tt_context_menu_add_folder = Add a folder to the currently open PackFile. Existing files are not overwriten!
tt_context_menu_add_from_packfile = Add files from another PackFile to the currently open PackFile. Existing files are not overwriten!
tt_context_menu_check_tables = Check all the DB Tables of the currently open PackFile for dependency errors.
tt_context_menu_new_folder = Open the dialog to create an empty folder. Due to how the PackFiles are done, these are NOT KEPT ON SAVING if they stay empty.
tt_context_menu_new_packed_file_anim_pack = Open the dialog to create an AnimPack.
tt_context_menu_new_packed_file_db = Open the dialog to create a DB Table (used by the game for... most of the things).
tt_context_menu_new_packed_file_loc = Open the dialog to create a Loc File (used by the game to store the texts you see ingame) in the selected folder.
tt_context_menu_new_packed_file_text = Open the dialog to create a Plain Text File. It accepts different extensions, like '.xml', '.lua', '.txt',....
tt_context_menu_new_queek_packed_file = Open the dialog to create a Packedfile based on the context. For example, if you launch this in /text, it'll create a loc PackedFile.
tt_context_menu_mass_import_tsv = Import a bunch of TSV files at the same time. It automatically checks if they are DB Tables, Locs or invalid TSVs, and imports them all at once. Existing files will be overwritten!
tt_context_menu_mass_export_tsv = Export every DB Table and Loc PackedFile from this PackFile as TSV files at the same time. Existing files will be overwritten!
tt_context_menu_merge_tables = Merge multple DB Tables/Loc PackedFiles into one.
tt_context_menu_update_tables = Update a table to the last known working version of it for the Current game Selected.
tt_context_menu_delete = Delete the selected File/Folder.

tt_context_menu_extract = Extract the selected File/Folder from the PackFile.
tt_context_menu_rename = Rename the selected File/Folder. Remember, whitespaces are NOT ALLOWED and duplicated names in the same folder will NOT BE RENAMED.
tt_context_menu_open_decoder = Open the selected table in the DB Decoder. To create/update schemas.
tt_context_menu_open_dependency_manager = Open the list of PackFiles referenced from this PackFile.
tt_context_menu_open_containing_folder = Open the currently open PackFile's location in your default file manager.
tt_context_menu_open_with_external_program = Open the PackedFile in an external program.
tt_context_menu_open_notes = Open the PackFile's Notes in a secondary view, without closing the currently open PackedFile in the Main View.
tt_filter_autoexpand_matches_button = Auto-Expand matches. NOTE: Filtering with all matches expanded in a big PackFile (+10k files, like data.pack) can hang the program for a while. You have been warned.
tt_filter_case_sensitive_button = Enable/Disable case sensitive filtering for the TreeView.

packedfile_editable_sequence = Editable Sequence

### Rename Dialogues

rename_selection = Rename Selection
rename_selection_instructions = Instructions
rename_selection_placeholder = Write here whatever you want. {"{"}x{"}"} it's your current name.

### Mass-Import

mass_import_tsv = Mass-Import TSV Files
mass_import_num_to_import = Files to import: 0.
mass_import_use_original_filename = Use original filename:
mass_import_import = Import
mass_import_default_name = new_imported_file

mass_import_select = Select TSV Files to Import...

files_to_import = Files to import: {"{"}{"}"}.

### Table

decoder_title = PackedFile Decoder
table_dependency_manager_title = Dependency Manager
table_filter_case_sensitive = Case Sensitive
table_enable_lookups = Use Lookups

### Contextual Menu for TreeView

context_menu_add = &Add...
context_menu_create = &Create...
context_menu_open = &Open...

context_menu_add_file = &Add File
context_menu_add_files = Add File/s
context_menu_add_folder = Add &Folder
context_menu_add_folders = Add Folder/s
context_menu_add_from_packfile = Add from &PackFile
context_menu_select_packfile = Select PackFile
context_menu_extract_packfile = Extract PackFile

context_menu_new_folder = Create Folder
context_menu_new_packed_file_anim_pack = Create AnimPack
context_menu_new_packed_file_db = Create DB
context_menu_new_packed_file_loc = Create Loc
context_menu_new_packed_file_text = Create Text
context_menu_new_queek_packed_file = New Queek File

context_menu_mass_import_tsv = Mass-Import TSV
context_menu_mass_export_tsv = Mass-Export TSV
context_menu_mass_export_tsv_folder = Select destination folder
context_menu_rename = &Rename
context_menu_delete = &Delete
context_menu_extract = &Extract

context_menu_open_decoder = &Open with Decoder
context_menu_open_dependency_manager = Open &Dependency Manager
context_menu_open_containing_folder = Open &Containing Folder
context_menu_open_with_external_program = Open with &External Program
context_menu_open_notes = Open &Notes

context_menu_check_tables = &Check Tables
context_menu_merge_tables = &Merge Tables
context_menu_update_table = &Update Table

### Shortcuts

menu_bar_packfile_section = PackFile Menu
menu_bar_mymod_section = MyMod Menu
menu_bar_view_section = View Menu
menu_bar_game_selected_section = Game Selected Menu
menu_bar_about_section = About Menu
packfile_contents_tree_view_section = PackFile Contents Contextual Menu
packed_file_table_section = Table PackedFile Contextual Menu
packed_file_decoder_section = PackedFile Decoder

shortcut_esc = Esc
shortcut_csp = Ctrl+Shift+P

shortcut_title = Shortcuts
shortcut_text = Shortcut
shortcut_section_action = Section/Action

### Settings

settings_title = Preferences

settings_game_paths_title = Game Paths
settings_extra_paths_title = Extra Paths
settings_paths_mymod = MyMod's Folder
settings_paths_mymod_ph = This is the folder where you want to store all "MyMod" related files.

settings_paths_zip = 7Zip Exe's Path
settings_paths_zip_ph = This is the full path to 7Zip's executable.

settings_game_label = TW: {"{"}{"}"} Folder
settings_game_line_ph = This is the folder where you have {"{"}{"}"} installed, where the .exe is.

settings_ui_title = UI Settings
settings_table_title = Table Settings

settings_ui_language = Language (Requires restart):
settings_ui_dark_theme = Use Dark Theme:
settings_ui_table_adjust_columns_to_content = Adjust Columns to Content:
settings_ui_table_disable_combos = Disable ComboBoxes on Tables:
settings_ui_table_extend_last_column_label = Extend Last Column on Tables:
settings_ui_table_tight_table_mode_label = Enable 'Tight Mode' on Tables:
settings_ui_table_remember_column_visual_order_label = Remember Column's Visual Order:
settings_ui_table_remember_table_state_permanently_label = Remember Table State Across PackFiles:
settings_ui_window_start_maximized_label = Start Maximized:
settings_ui_window_hide_background_icon = Hide Background Game Selected Icon:

settings_select_file = Select File
settings_select_folder = Select Folder

settings_extra_title = Extra Settings
settings_default_game = Default Game:
settings_check_updates_on_start = Check Updates on Start:
settings_check_schema_updates_on_start = Check Schema Updates on Start:
settings_check_template_updates_on_start = Check Template Updates on Start:
settings_allow_editing_of_ca_packfiles = Allow Editing of CA PackFiles:
settings_optimize_not_renamed_packedfiles = Optimize Non-Renamed PackedFiles:
settings_use_lazy_loading = Use Lazy-Loading for PackFiles:
settings_disable_uuid_regeneration_tables = Disable UUID Regeneration on DB Tables:
settings_packfile_treeview_resize_to_fit = Resize TreeView to content's size:
settings_table_resize_on_edit = Resize tables on edits to content's size:

settings_debug_title = Debug Settings
settings_debug_missing_table = Check for Missing Table Definitions
settings_debug_enable_debug_menu = Enable Debug Menu

settings_diagnostics_title = Diagnostics Settings
settings_diagnostics_show_panel_on_boot = Enable Diagnostics Tool:
settings_diagnostics_trigger_on_open = Trigger Diagnostics Check on Open PackFile:
settings_diagnostics_trigger_on_edit = Trigger Diagnostics Check on Table Editing:

settings_text_title = Text Editor Settings

settings_warning_message = <p><b style="color:red;">WARNING: Most of these settings require you to restart the program in order to take effect!</b></p><p></p>

### Settings Tips

tt_ui_global_use_dark_theme_tip = <i>Ash nazg durbatulûk, ash nazg gimbatul, ash nazg thrakatulûk, agh burzum-ishi krimpatul</i>
tt_ui_table_adjust_columns_to_content_tip = If you enable this, when you open a DB Table or Loc File, all columns will be automatically resized depending on their content's size.
    Otherwise, columns will have a predefined size. Either way, you'll be able to resize them manually after the initial resize.
    NOTE: This can make very big tables take more time to load.
tt_ui_table_disable_combos_tip = If you disable this, no more combos will be shown in referenced columns in tables. This means no combos nor autocompletion on DB Tables.
    Now shut up Baldy.
tt_ui_table_extend_last_column_tip = If you enable this, the last column on DB Tables and Loc PackedFiles will extend itself to fill the empty space at his right, if there is any.
tt_ui_table_tight_table_mode_tip = If you enable this, the vertical useless space in tables will be reduced, so you can see more data at the same time.
tt_ui_table_remember_column_visual_order_tip = Enable this to make RPFM remember the visual order of the columns of a DB Table/LOC, when closing it and opening it again.
tt_ui_table_remember_table_state_permanently_tip = If you enable this, RPFM will remember the state of a DB Table or Loc PackedFile (filter data, columns moved, what column was sorting the Table,...) even when you close RPFM and open it again. If you don't want this behavior, leave this disabled.
tt_ui_window_start_maximized_tip = If you enable this, RPFM will start maximized.


tt_extra_network_check_updates_on_start_tip = If you enable this, RPFM will check for updates at the start of the program, and inform you if there is any update available.
    Whether download it or not is up to you.
tt_extra_network_check_schema_updates_on_start_tip = If you enable this, RPFM will check for schema updates at the start of the program,
    and allow you to automatically download it if there is any update available.
tt_extra_packfile_allow_editing_of_ca_packfiles_tip = By default, only PackFiles of Type 'Mod' and 'Movie' are editables, as those are the only ones used for modding.
    If you enable this, you'll be able to edit 'Boot', 'Release' and 'Patch' PackFiles too. Just be careful of not writing over one of the game's original PackFiles!
tt_extra_packfile_optimize_not_renamed_packedfiles_tip = If you enable this, when running the 'Optimize PackFile' feature RPFM will optimize Tables and Locs that have the same name as their vanilla counterparts.
    Usually, those files are intended to fully override their vanilla counterparts, so by default (this setting off) they are ignored by the optimizer. But it can be useful sometimes to optimize them too (AssKit including too many files), so that's why this setting exists.
tt_extra_packfile_use_lazy_loading_tip = If you enable this, PackFiles will load their data on-demand from the disk instead of loading the entire PackFile to Ram. This reduces Ram usage by a lot, but if something else changes/deletes the PackFile while it's open, the PackFile will likely be unrecoverable and you'll lose whatever is in it.
    If you mainly mod in Warhammer 2's /data folder LEAVE THIS DISABLED, as a bug in the Assembly Kit causes PackFiles to become broken/be deleted when you have this enabled.
tt_extra_disable_uuid_regeneration_on_db_tables_label_tip = Check this if you plan to put your binary tables under Git/Svn/any kind of version control software.

tt_debug_check_for_missing_table_definitions_tip = If you enable this, RPFM will try to decode EVERY TABLE in the current PackFile when opening it or when changing the Game Selected, and it'll output all the tables without an schema to a \"missing_table_definitions.txt\" file.
    DEBUG FEATURE, VERY SLOW. DON'T ENABLE IT UNLESS YOU REALLY WANT TO USE IT.

tt_diagnostics_enable_diagnostics_tool_tip = Enable this to make the diagnostics panel appear on start.
tt_diagnostics_trigger_diagnostics_on_open_tip = Enable this to trigger a full PackFile Diagnostics check when opening a PackFile.
tt_diagnostics_trigger_diagnostics_on_table_edit_tip = Enable this to trigger a limited diagnostics check each time you edit a table.

### CA_VP8 Videos

format = Format:
version = Version:
header_len = Header Lenght:
codec_four_cc = Codec Four CC:
width = Width:
height = Height:
ms_per_frame = Ms Per Frame:
num_frames = Number of Frames:
largest_frame = Largest Frame:
mistery_number = I don't know what this is:
offset_frame_table = Frame Table's Offset:
framerate = Framerate:
timebase = Timebase:
x2 = I don't know what this is:

convert_to_camv = Convert to CAMV
convert_to_ivf = Convert to IVF

notes = Notes

external_current_path = Current path for edition:
stop_watching = Stop watching the file
open_folder = Open folder in file manager

game_selected_changed_on_opening = Game Selected changed to {"{"}{"}"}, as the PackFile you opened is not compatible with the game you had selected.

### Extra stuff I don't remember where it goes.

rpfm_title = Rusted PackFile Manager
delete_mymod_0 = <p>You are about to delete this <i>'MyMod'</i> from your disk.</p><p>There is no way to recover it after that.</p><p>Are you sure?</p>
delete_mymod_1 = <p>There are some changes yet to be saved.</p><p>Are you sure?</p>

api_response_success_new_stable_update = <h4>New major stable update found: {"{"}{"}"}</h4> <p>Please, make sure to save your work in progress before hitting 'Update', or you may lose it.</p>
api_response_success_new_beta_update = <h4>New beta update found: {"{"}{"}"}</h4><p>Please, make sure to save your work in progress before hitting 'Update', or you may lose it.</p>
api_response_success_new_update_hotfix = <h4>New minor update/hotfix found: {"{"}{"}"}</h4><p>Please, make sure to save your work in progress before hitting 'Update', or you may lose it.</p>
api_response_success_no_update = <h4>No new updates available</h4> <p>More luck next time :)</p>
api_response_success_unknown_version = <h4>Error while checking new updates</h4> <p>There has been a problem when getting the lastest released version number, or the current version number. That means I fucked up the last release title. If you see this, please report it here:\n<a href=\"https://github.com/Frodo45127/rpfm/issues\">https://github.com/Frodo45127/rpfm/issues</a></p>
api_response_error = <h4>Error while checking new updates :(</h4> {"{"}{"}"}

schema_no_update = <h4>No new schema updates available</h4> <p>More luck next time :)</p>
schema_new_update = <h4>New schema update available</h4> <p>Do you want to update the schemas?</p>

template_no_update = <h4>No new template updates available</h4> <p>More luck next time :)</p>
template_new_update = <h4>New template update available</h4> <p>Do you want to update the templates?</p>

api_response_schema_error = <h4>Error while checking new updates :(</h4> <p>If you see this message, there has been a problem with your connection to the Github.com server. Please, make sure you can access to <a href=\"https://api.github.com\">https://api.github.com</a> and try again.</p>
schema_update_success = <h4>Schemas updated and reloaded</h4><p>You can continue using RPFM now.</p>
template_update_success = <h4>Templates updated and reloaded</h4><p>You can continue using RPFM now.</p>

files_extracted_success = {"{"}{"}"} files extracted. No errors detected.
mymod_delete_success = MyMod successfully deleted: \"{"{"}{"}"}\"

generate_pak_success = PAK File succesfully created and reloaded.
game_selected_unsupported_operation = This operation is not supported for the Game Selected.

optimize_packfile_success = PackFile optimized.
update_current_schema_from_asskit_success = Currently loaded schema updated.
generate_schema_diff_success = Diff generated succesfully.
settings_font_title = Font Settings

title_success = Success!
title_error = Error!

rename_instructions = It's easy, but you'll not understand it without an example, so here it's one:
     - Your files/folders says 'you' and 'I'.
     - Write 'whatever {"{"}x{"}"} want' in the box below.
     - Hit 'Accept'.
     - RPFM will turn that into 'whatever you want' and 'whatever I want' and call your files/folders that.
    And, in case you ask, works with numeric cells too, as long as the resulting text is a valid number.

update_table_success = Table updated from version '{"{"}{"}"}' to version '{"{"}{"}"}'.
no_errors_detected = No errors detected.
original_data = Original Data: '{"{"}{"}"}'
column_tooltip_1 = This column is a reference to:
column_tooltip_2 = And many more. Exactly, {"{"}{"}"} more. Too many to show them here.
column_tooltip_3 = Fields that reference this column:

tsv_select_title = Select TSV File to Import...
tsv_export_title = Export TSV File...

rewrite_selection_title = Rewrite Selection
rewrite_selection_instructions_title = Instructions
rewrite_selection_instructions = Legend says:
     - {"{"}x{"}"} means current value.
     - {"{"}y{"}"} means current column.
     - {"{"}z{"}"} means current row.
rewrite_selection_is_math = Is a math operation?
rewrite_selection_placeholder = Write here whatever you want.
rewrite_selection_accept = Accept

context_menu_apply_submenu = A&pply...
context_menu_clone_submenu = &Clone...
context_menu_copy_submenu = &Copy...
context_menu_add_rows = &Add Row
context_menu_insert_rows = &Insert Row
context_menu_delete_rows = &Delete Row
context_menu_rewrite_selection = &Rewrite Selection
context_menu_clone_and_insert = &Clone and Insert
context_menu_clone_and_append = Clone and &Append
context_menu_copy = &Copy
context_menu_copy_as_lua_table = &Copy as &LUA Table
context_menu_paste = &Paste
context_menu_search = &Search
context_menu_sidebar = Si&debar
context_menu_import_tsv = &Import TSV
context_menu_export_tsv = &Export TSV
context_menu_invert_selection = Inver&t Selection
context_menu_reset_selection = Reset &Selection
context_menu_resize_columns = Resize Columns
context_menu_undo = &Undo
context_menu_redo = &Redo
context_menu_cascade_edition = Rename References

header_column = <b><i>Column Name</i></b>
header_hidden = <b><i>Hidden</i></b>
header_frozen = <b><i>Frozen</i></b>

file_count = File Count:
file_paths = File Paths:
animpack_unpack = Unpack

special_stuff_repack_animtable = RePack AnimTable
tt_repack_animtable = This action repacks an animtable (if found) back into an AnimPack.

load_template = Load Template
load_templates_dialog_title = Load Template
load_templates_dialog_accept = Load Template

nested_table_title = Nested Table
nested_table_accept = Accept

about_check_template_updates = Check Template Updates
uodate_templates_success = Templates updated correctly.
tt_uodate_templates = This command attemps to update your templates.

integer_1 = Unknown integer 1:
integer_2 = Unknown integer 2:

settings_update_channel = Update Channel
update_success_main_program = <h4>RPFM updated correctly!</h4> <p>To check what changed in this update, check this link: <a href='file:///{"{"}{"}"}'>CHANGELOG.md</a>. If you're updating to a beta, the relevant changes are on the "Unreleased" section.</p> <p>Please, restart the program for the changes to apply.</p>

settings_autosave_interval = Autosave Interval (min)
autosaving = Autosaving...
autosaved = Autosaved
error_autosave_non_editable = This PackFile cannot be autosaved.

settings_ui_table_use_old_column_order_label = Use Old Column Order (Keys first):

context_menu_paste_as_new_row = Paste as New Row

gen_loc_diagnostics = Diagnostics
diagnostics_button_check_packfile = Check PackFile
diagnostics_button_check_current_packed_file = Check Open PackedFiles Only
diagnostics_button_error = Error
diagnostics_button_warning = Warning
diagnostics_button_info = Info
diagnostics_button_only_current_packed_file = Open PackedFiles Only

diagnostics_colum_level = Level
diagnostics_colum_column = Column
diagnostics_colum_row = Row
diagnostics_colum_path = Path
diagnostics_colum_message = Message

context_menu_copy_path = Copy Path
mymod_open_mymod_folder = Open MyMod Folder
open_from_autosave = Open From Autosave

all = All
settings_expand_treeview_when_adding_items = Expand new TreeView items when added:
settings_expand_treeview_when_adding_items_tip = Set this to true if you want folders to be expanded when added to the TreeView. Set it to false to not expand them.

label_outdated_table = Outdated table:
label_invalid_reference = Invalid reference:
label_empty_row = Empty row:
label_empty_key_field = Empty key field:
label_empty_key_fields = Empty key fields:
label_duplicated_combined_keys = Duplicated combined keys:
label_no_reference_table_found = No reference table found:
label_no_reference_table_nor_column_found_pak = No reference Table/Column found:
label_no_reference_table_nor_column_found_no_pak = No reference Table/Column/PAK found:
label_invalid_escape = Invalid escape:
label_duplicated_row = Duplicated row:
label_invalid_dependency_packfile = Invalid dependency PackFile:

diagnostics_button_show_more_filters = Show more filters
diagnostics_colum_report_type = Report Type

diagnostic_type = Diagnostic Report Type
diagnostic_show = Show?

dependency_packfile_list_label = <p><b style="color:red;">WARNING: Adding a PackFile to this list will load that PackFile if present EVEN IF IT'S NOT SELECTED IN THE MOD MANAGER!</b></p><p></p>

context_menu_open_packfile_settings = Open PackFile Settings
pfs_diagnostics_files_to_ignore_label = <p><b><i>PackedFiles to Ignore on Diagnostics Check</i></b></p>
pfs_diagnostics_files_to_ignore_description_label = <p>------------</p><p>The PackedFiles on this list will be ignored when doing a diagnostics check. They'll still be used as source data for other things (like providing reference data) but they will not be analyzed.</p><p><b>One path per line.</b> The following are valid examples</p>
    <ul>
        <li>
        <i><b>db/land_units_tables</b></i> => All tables in that folder will be ignored.
        </li>
        <li>
        <i><b>db/land_units_tables/table1</b></i> => That exact table will be ignored.
        </li>
        <li>
        <i><b>db/land_units_tables/table2;field1,field2</b></i> => Only those two fields of that specific table will be ignored.
        </li>
        <li>
        <i><b>db/land_units_tables;field1,field2</b></i> => Only those two fields of all tables in that folder will be ignored.
        </li>
    </ul>
    <br/>

pfs_import_files_to_ignore_label = <p><b><i>Files to Ignore when Importing</i></b></p>
pfs_import_files_to_ignore_description_label = <p>The files on this list will be ignored when importing from a MyMod folder. Only for MyMods. Paths are relative, the glory of the empire is absolute.</p>
pfs_disable_autosaves_label = <p><b><i>Disable Autosaves for this PackFile</i></b></p>
pfs_disable_autosaves_description_label = <p></p>

instructions_ca_vp8 = It's simple, the video can have 2 formats: CAMV (used by the game) and IVF (reproducible on a media player with VP8 codecs).
  To export a video, convert it to IVF and extract it.
  To make it load in-game, convert it to CAMV and save the PackFile.

settings_debug_spoof_ca_authoring_tool = Spoof CA's Authoring Tool
tt_settings_debug_spoof_ca_authoring_tool = Checking this will make all PFH6 PackFiles saved with RPFM to be marked as "Saved with CA-TOOL". For testing purpouses only.

template_name = Name:
template_description = Description:
template_author = Author:
template_post_message = Post Message:
save_template = Save PackFile to Template

new_template_sections = Sections
new_template_options = Options
new_template_params = Parameters
new_template_info = Basic Info

new_template_sections_description = <p>Sections or Steps this template will be splitted in.</p>
 <p>By default, all steps will show in the order they're here, but you can hide them to only appear if certain options are selected. The columns mean:
    <ul>
       <li>Key: Internal name of the section.</li>
       <li>Name: Text the user will see when using the Template.</li>
       <li>Required Options: Options required for this section to appear.</li>
    </ul>
 </p>

new_template_options_description = <p>These are options/flags/however you want to call them.</p>
 <p>They control what parts of the template can be enabled/disabled when loading it to a PackFile.
 For example, in a template for projectiles, an option can be "Has custom explosion?" or "Has custom display proyectile?".</p>
 The columns mean:
 <ul>
    <li>The first column is the internal name of the option.</li>
    <li>The second column is the text the user will see when using the Template.</li>
 </ul>

new_template_params_description = <p>These are the parameters that can be applied to the Template by the user when loading it to a PackFile.</p>
 <p>They allow the user to personalize parts of the template for his use, like changing the name of the files, the value on cells,...</p>
 The columns mean:
 <ul>
    <li>The first column is the internal name of the parameter.</li>
    <li>The second column is the text the user will see when using the Template.</li>
 </ul>

new_template_info_description = <p>This is where you can set up some meta data of this .</p>

key = Key
name = Name
section = Section
required_options = Required Options
param_type = Param Type

load_template_info_section = Template's Info
load_template_options_section = Options
load_template_params_section = Parameters

close_tab = Close Tab
close_all_other_tabs = Close Other Tabs
close_tabs_to_left = Close Tabs to the Left
close_tabs_to_right = Close Tabs to the Right
prev_tab = Next Tab
next_tab = Previous Tab

settings_debug_clear_autosave_folder = Clear autosave folder
settings_debug_clear_schema_folder = Clear schema folder
settings_debug_clear_layout_settings = Clear layout settings
tt_settings_debug_clear_autosave_folder = Use this to clear the entire autosave folder, either to clear space on your disk, or to apply the changes to autosave amount, if any.
tt_settings_debug_clear_schema_folder = Use this to clear the entire schema folder. Just in case the updater fails.
tt_settings_debug_clear_layout_settings = Use this to clear the layout special settings and restore the UI to its initial state.

autosaves_cleared = Autosave folder deleted. It'll be regenerated the next time you start the program.
schemas_cleared = Schemas folder deleted. Please, remember to re-download the schemas to be able to open tables.

settings_autosave_amount = Autosave Amount (min 1)
tt_settings_autosave_amount = Sets the amount of autosaves RPFM is allowed to use. If you reduce this number, you need to hit "Clear Autosave Folder" to delete the extra autosaves. Keep in mind this resets the entire autosave folder.

restart_button = Restart
error_not_booted_from_launcher = This window of RPFM has not been launched from the "rpfm.exe" file, but directly from the "rpfm_ui.exe" file. Since version 2.3.102, you should launch it from "rpfm.exe" (or equivalent) to support certain features regarding the update system.

install_sucess = PackFile successfully instaled.
uninstall_sucess = PackFile successfully uninstaled.

outdated_table_explanation = Tables have an internal version number that changes whenever CA does an update to said table that changes its structure.
    An outdated table means your table may have structural differences introduced in newer versions, like new/changed columns.

    This can have consecuences ranging from not being able to use certain new features, to straigh crashes, depending on the table and changes.
    It's advised to always update your tables after a patch by opening your PackFile, right-clicking your table, and clicking in "Update Table".

    Keep in mind RPFM fills new columns with default data on update. After updating a table, make sure its data is still correct!
    Otherwise, you may find that you needed to put something in the new columns for the game not to crash...

invalid_reference_explanation = Some table columns reference another table's columns. "Invalid Reference" means the data present in a cell it's not present in any of the tables that cell references.
    This is usually due to a typo, a table update, a submod that doesn't reference the parent mod,...

    This is one of the most common causes of crashes on start, and you have to make sure to fix these when they popup if you want to avoid crashes.
    One special situation is if this mod is a submod of another mod. In that case, you have to open your PackFile, right-clicking it, and click in "Open/Open Dependency Manager".
    Then, add the full name of the parent mod to the list. For example, "Luccini.pack". That will make RPFM to take that mod into account when checking for these kind of errors.

empty_row_explanation = Empty rows on tables have no uses, and can cause all kind of issues in the long run.
    It's strongly advised to remove them.

empty_key_field_explanation = Tables may have one or more "key" columns that have (usually) to be unique in the entire table.
    Empty key fields can cause problems, ranging from effects not working to crashes. It's strongly advised to fix them.

empty_key_fields_explanation =  Tables may have one or more "key" columns that have (usually) to be unique in the entire table. This error means all the "key" columns in a row are empty.
    Empty key fields can cause problems, ranging from effects not working to crashes. It's strongly advised to fix them.

duplicated_combined_keys_explanation = Tables may have one or more "key" columns that have (usually) to be unique in the entire table. This error means you have two rows with the same key.
    Empty key fields can cause problems, ranging from effects not working to crashes. It's strongly advised to remove one of them.

    If this triggers due to a false positive, go to your PackFile, right-click it, and click on "Open/Open PackFile Settings".
    Then, add the table/field is giving the false positive to the "PackedFiles to Ignore on Diagnostics Check" list and save the PackFile.

no_reference_table_found_explanation = Some table columns reference another table's columns. This means a column was found that referenced a table that RPFM couldn't find.
    This is either an issue with the schema, or just a table reference CA forgot to update.

    In any case, this message is only informative and you can ignore it.

no_reference_table_nor_column_found_pak_explanation = Some tables found in the Assembly Kit are not in data.pack or equivalent for different reasons. To be able to read those table quickly,
    RPFM stores them in a PAK file generated by going into "Special Stuff" and clicking in "Generate PAK file".

    This message means that a table is referencing a column on another table, but that column couldn't be found in the referenced table. Not even in the tables stored in the PAK file.
    This message is harmless, and is only useful for internal debugging. You can ignore it.

no_reference_table_nor_column_found_no_pak_explanation = Some tables found in the Assembly Kit are not in data.pack or equivalent for different reasons. To be able to read those table quickly,
    RPFM stores them in a PAK file generated by going into "Special Stuff" and clicking in "Generate PAK file".

    This message means that a table is referencing a column on another table, but that column couldn't be found in the referenced table,
    and RPFM didn't find a PAK for the game, so it doesn't know if the problem is due to the missing PAK file, or due to an error.

    If you see this message, genetate the PAK file for your game by going into "Special Stuff" and clicking in "Generate PAK file".

invalid_escape_explanation = Certain characters, like \n (jumpline) and \t (tabulation) need to be escaped in a special way in order for the game to recognize them.
    This error means RPFM has detected one of these characters that's not escaped correctly, causing it to show incorrectly ingame.

    To fix it, make sure you use \\n or \\t (with two slashes) instead.

duplicated_row_explanation = Table rows usually convey one specific data to the game. For example, one row may indicate X unit has X ability.
    This error means there are 2 or more rows in a table that are exactly the same.

    This can cause problems and it's adviced to leave only one copy of each row in a table.

invalid_dependency_pack_file_name_explanation = One of the PackFile Names in the Dependency Manager has an invalid format. Things that cause this error are:
    - Empty rows on the Dependency Manager.
    - A PackFile name not ended in ".pack".
    - A PackFile name containing an space.

pfs_button_apply = Apply Settings
cascade_edition_dialog = Rename References
template_load_final_message = And with that, the template is done. Make sure to follow the steps here in case the template needs them.
is_required = Is Required
context_menu_generate_ids = Generate Ids
generate_ids = Generate Ids
generate_ids_title = Generate Ids
generate_ids_instructions_title = Instructions
generate_ids_instructions = It's simple, write the initial id in the box below and hit accept.
generate_ids_accept = Accept

context_menu_delete_filtered_out_rows = Delete Filtered-out Rows
are_you_sure_delete_filtered_out_rows = This will delete all filtered-out rows. Are you sure?

context_menu_go_to = Go To...
context_menu_go_to_definition = Go To Definition
source_data_for_field_not_found = The source of the selected data could not be found.
context_menu_go_to_loc = Go To Loc Entry:  {"{"}{"}"}
loc_key_not_found = The loc entry couldn't be found.
table_filter_show_blank_cells = Show Blank Cells
special_stuff_rescue_packfile = Rescue PackFile
are_you_sure_rescue_packfile = Are you sure you want to do this? This is a dangerous option that should never be used unless the dev or RPFM tells you to specifically use it.
    So again, are you sure you want to use this?

filter_group = Group
