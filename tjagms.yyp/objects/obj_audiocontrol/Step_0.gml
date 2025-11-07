
if(is_counting)
{
	time_offset_counter += delta_time / 1000000 * 60;
	
	show_debug_message("{0}, {1}", time_offset_counter, time_offset_cap)

	if(time_offset_counter >= time_offset_cap)
	{
		
		is_counting = false;
		playbackid = audio_play_sound_ext({
			sound: songstream,
			gain: 0.2
			});
	}
	
}


