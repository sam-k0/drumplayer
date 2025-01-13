/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben


if( keyboard_check(vk_left) )
{
	x -= 32;
}

if(keyboard_check(vk_right))
{
	x+= 32
}


var press_don = keyboard_check_pressed(ord("A"))
if (press_don)
{
	audio_play_sound(snd_don,0,false);
}


var press_ka = keyboard_check_pressed(ord("D"))
if (press_ka)
{
	audio_play_sound(snd_katsu,0,false);
}