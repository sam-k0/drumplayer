/// @description Insert description here
// You can write your code in this editor

shader_set(shd_rainbow)
shader_set_uniform_f(u_time, current_time/1000)

draw_sprite(sprbg_songselect_2, 0,0,0);

shader_reset()

var acc = (current_index+num_boxes/2) % array_length(found_map_structs);

draw_text(x+room_width/2+200,y,string(found_map_structs[acc][$ "title"]))
