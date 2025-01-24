if (input_by_arr(up_scroll_keys)) {
    scroll_up();
	audio_play_sound_ext({ sound: snd_don,
							gain: 0.3});
}

if (input_by_arr(down_scroll_keys)) {
    scroll_down();
	audio_play_sound_ext({ sound: snd_katsu,
							gain: 0.3});
}

