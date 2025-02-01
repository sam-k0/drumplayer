
shader_set(shd_rainbow)
shader_set_uniform_f(u_time, current_time/1000)

draw_sprite(sprbg_songselect_2, 0,0,0);

shader_reset()