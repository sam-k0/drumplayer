if (input_by_arr(up_scroll_keys)) 
{

	switch(submenu_id)
	{
		case MENU.SONGLIST:
    		scroll_up();
			break;
			
		case MENU.DIFFICULTY:
			// Scroll diff
			difficulty_selected += 1;
			difficulty_selected = clamp(difficulty_selected, 0, get_diff_arr_len()-1)
			show_debug_message(difficulty_selected);
			break;
		
	}


	audio_play_sound_ext({ sound: snd_don,
							gain: 0.3});
}

if (input_by_arr(down_scroll_keys)) 
{
	switch(submenu_id)
	{
		case MENU.SONGLIST:
    		scroll_down();
			break;
			
		case MENU.DIFFICULTY:
			// Scroll diff
			difficulty_selected -= 1;
			difficulty_selected = clamp(difficulty_selected, 0, get_diff_arr_len()-1)
			show_debug_message(difficulty_selected);
			
			break;
		
	}
	
	audio_play_sound_ext({ sound: snd_katsu,
							gain: 0.3});
}

// confirm
if(input_by_arr(confirm_keys))
{
	switch(submenu_id)
	{
		case MENU.SONGLIST:
			submenu_id = MENU.DIFFICULTY;
			layer_set_visible("Diff_bg", true)
			confirm_song();
			break;
			
		case MENU.DIFFICULTY:
			// Start song
			
			var acc = (current_index+num_boxes/2) % array_length(found_map_structs); // Current selection
			var selected = found_map_structs[acc]; // Contains struct now
			
			/*MAPFILE = selected[$"dir_path"] + "/" + selected[$"tja_file"];
			SONGFILE = selected[$"dir_path"] + "/" + selected[$"sound_file"];
			
			show_debug_message(MAPFILE)
			show_debug_message(SONGFILE)
			*/
			room_goto(rm_songplay)
			
			break;
		
	}
}


if(input_by_arr(back_keys))
{
	switch(submenu_id)
	{
		case MENU.SONGLIST:
			break;
			
		case MENU.DIFFICULTY:
			layer_set_visible("Diff_bg", false)
			submenu_id = MENU.SONGLIST;
			break;
		
	}
	
}
