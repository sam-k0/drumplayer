
x += TIME_OFFSET * 60 * scrollspeed;
active = true;

function isHit()
{
	if(!active) // avoid double calling
	{
		return;
	}
	audio_play_sound_ext({
		sound: hitsound,// Don/Katsu
		gain: 0.2}) 
	// Set position to start path to make sure all notes have the same path
	x = obj_hitField.x;
	y = obj_hitField.y
	path_start(path_hit, scrollspeed*3,path_action_stop, false )
			
	active = false; // do not play sounds / path multiple times
	// change layer to bg
	layer_add_instance("Instances_hitnotes", id);
	obj_hitField.combo ++;
}