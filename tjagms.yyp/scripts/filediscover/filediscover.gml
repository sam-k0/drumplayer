function get_subdirs(_root_dir)
{
	var found_dirs = []
	
	var d = file_find_first(_root_dir + "/*", fa_directory)
	while(d != "")
	{
		if(string_replace(d, ".", "") == d)
		{
			array_push(found_dirs, d)
		}
		d = file_find_next()		
		
	}
	file_find_close()
	return found_dirs
	
}

// returns a struct with meta info about the map 
function get_song_meta(tjaFilePath) {
    var title = "";
    var subtitle = "";
    var file = file_text_open_read(tjaFilePath);
    var difficulties = []
   
    while (!file_text_eof(file)) {
        var line = file_text_read_string(file);
        file_text_readln(file); // Move to the next line
        
        // Check for TITLE field
        if (string_copy(line, 1, 6) == "TITLE:") {
            title = string_trim(string_delete(line, 1, 6)); 
        }
        // Check for SUBTITLE field
        else if (string_copy(line, 1, 9) == "SUBTITLE:") {
            subtitle = string_trim(string_delete(line, 1, 9));
        }
        
        if (string_copy(line, 1, 7) == "COURSE:") {
        	show_debug_message("Found difficulty label: {0}",line)
        	array_push(difficulties,string_trim(string_delete(line, 1, 7)));
        }
    }
    
    // Close the file
    file_text_close(file);
    
    // Return the extracted fields
    return {title: title, subtitle: subtitle, difficulties: difficulties};
}


// returns an array of struct with info about found maps in provided directory
function find_map_files(_root_dir=working_directory)
{
	var _found_maps = []
	var subdirs = get_subdirs(_root_dir);
	
	for (var i = 0; i < array_length(subdirs); ++i) 
	{
		var thisdir = _root_dir + "/" + subdirs[i];
		
		show_debug_message("Checking "+thisdir)
		if(directory_exists(thisdir))
		{
		
			show_debug_message("exists")
			// Check if contains tja and ogg file : assuming only one of them exist
			var _tja_file = file_find_first(thisdir + "/*.tja", fa_readonly);
			file_find_close();
			
			var _ogg_file = file_find_first(thisdir + "/*.ogg", fa_readonly);
			file_find_close();
			
			if(_tja_file != "" && _ogg_file != "")
			{ // A valid subdir
				
				// quick extract
				var _m = get_song_meta(thisdir + "/" + _tja_file);
				
				
				array_push(_found_maps, {
					title : _m[$ "title"],
					subtitle : string_replace( _m[$ "subtitle"], "--", ""),
					tja_file : _tja_file,
					sound_file : _ogg_file,
					dir_path : thisdir,
					difficulties : _m[$ "difficulties"]
				})
			}
			else // one of them missing
			{
				show_debug_message("directory {0} skipped: missing a filetype ({1} or {2})", _sub_dir_path, _tja_file, _ogg_file)
			}
		}

	}

	return _found_maps;
}