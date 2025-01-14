
if(active)
{
	 x-= scrollspeed * delta_time / 1000000 * 60;
 
	if(point_distance(obj_hitField.x, y, x, y) < scrollspeed*2)
	{
		var prev_x = x - scrollspeed; // Previous x position based on speed
		if (collision_line(prev_x, y, x, y, obj_hitField, false, true)) 
		{
			audio_play_sound(hitsound, 0, 0) // Don/Katsu
			// Set position to start path to make sure all notes have the same path
			x = obj_hitField.x;
			y = obj_hitField.y
			path_start(path_hit, scrollspeed*3,path_action_stop, false )
			
			active = false; // do not play sounds / path multiple times
			// change layer to bg
			layer_add_instance("Instances_hitnotes", id);
		}
	}
}