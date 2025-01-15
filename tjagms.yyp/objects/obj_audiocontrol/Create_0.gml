songstream = audio_create_stream(songfile) // songfile is expected as struct arg
playbackid = audio_play_sound_ext({
	sound: songstream,
	gain: 0.2
	});
