/// Delete stream

if (playbackid == async_load[? "sound_id"])
{
	// Delete sound stream 
	if (audio_destroy_stream(songstream) == -1 && !song_cleaned) // could be cleaned by exiting early
	{
		show_error("Song stream was not destroyed in Async Event!",true);
	}
	else{
		song_cleaned = true
	    show_debug_message("Song stream {0} successfully destroyed.", playbackid)
		alarm[0] = game_get_speed(0)*3; // Go back to menu?
		
	}
}