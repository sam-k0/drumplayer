// Clean up stream
if (audio_destroy_stream(songstream) == -1 && !song_cleaned) // it could be already cleaned by async event
{
	show_error("Song stream was not destroyed in Clean Up Event!",true);
}
else{
	show_debug_message("Song stream {0} successfully destroyed.", playbackid)
	song_cleaned = true;
}