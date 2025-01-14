/// Delete stream

if (playbackid == async_load[? "sound_id"])
{
	// Delete sound stream 
	if (audio_destroy_stream(songstream) == -1)
	{
		show_error("Song stream was not destroyed in Async Event!",true);
	}
	else{
	    show_debug_message("Song stream {0} successfully destroyed.", playbackid)
	}
}