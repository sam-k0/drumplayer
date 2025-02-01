/// @description Insert description here
// You can write your code in this editor

var camera_width = camera_get_view_width(camera_get_active());
var camera_height = camera_get_view_height(camera_get_active())

var acc = (current_index+num_boxes/2) % array_length(found_map_structs);

draw_text(x+room_width/2+200,y,string(found_map_structs[acc][$ "title"]))
var sprh= sprite_get_height(spr_songEntry);
draw_sprite_ext(spr_songEntry, 0, //
	boxes[4].x,
	boxes[4].y, 1.05,1.05,0,c_red,0.4)
	
// Draw controls
draw_sprite(spr_drumGame, 0, camera_width/4*3, camera_height-256)

// draw difficulty labels
// Get the labels from current map
if(submenu_id == MENU.DIFFICULTY)
{
	var acc = (current_index+num_boxes/2) % array_length(found_map_structs); // Current selection
	var selected = found_map_structs[acc]; // Contains struct now
	var diff_array = selected[$"difficulties"];
	var ax = camera_width / 4*3;
	var ay = camera_height / 2;
	
	// Draw "select diff"
	draw_set_font(fnt_trad_24)
	draw_set_halign(fa_left)
	draw_text(ax+8,ay-128, "Select difficulty")
	
	// draw current label name
	draw_text(ax+8, ay+96, diff_array[difficulty_selected])
	

	
	for (var i = 0; i < array_length(diff_array); i++)
	{
		var did = diff_label_to_sprid(diff_array[i]);
		
		if(difficulty_selected == i)
		{
			draw_sprite_ext(spr_difficultyIcon, did, ax+64*i, ay, 1.1,1.1,0,c_black,1);
		}
		
		draw_sprite(spr_difficultyIcon,did, ax+64*i,ay)
	}
}



