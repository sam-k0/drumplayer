
if(active)
{
	 x-= scrollspeed * delta_time / 1000000 * 60;
 
	if(point_distance(obj_hitField.x, y, x, y) < scrollspeed*2)
	{
		var prev_x = x - scrollspeed; // Previous x position based on speed
		if (collision_line(prev_x, y, x, y, obj_hitField, false, true)) 
		{
			if(true)
			{
			isHit()		
			}
			if(ds_list_find_index(obj_hitField.next_notes_list, id) == -1)
			{
				ds_list_add(obj_hitField.next_notes_list, id);
			}
		}
		else
		{
			var mypos = ds_list_find_index(obj_hitField.next_notes_list, id);
			if (mypos != -1)
			{
				ds_list_delete(obj_hitField.next_notes_list, mypos);
			}
			
		}
	}
}