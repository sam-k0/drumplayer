/// @description Insert description here
// You can write your code in this editor
x-= scrollspeed * delta_time / 1000000 * 60;


if (point_distance(obj_main.x, y, x,y) < 5)
{
	audio_play_sound(snd_katsu, 0, 0)
	instance_destroy()
}