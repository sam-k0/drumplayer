/// @description Inputs

//Check presses
for (var i = 0; i < array_length(don_keys); i++) {
	key_states_don[i] = key_states_don[i] * 0.8 // Decrease smooth
	key_states_don[i] = max(keyboard_check_pressed(don_keys[i]), key_states_don[i]) // Take either 1 or orig val
	key_states_don[i] = clamp(key_states_don[i], 0,1) // Cut off -0
}

for (var i = 0; i < array_length(katsu_keys); i++) {
	key_states_katsu[i] = key_states_katsu[i] * 0.8
	key_states_katsu[i] = max(keyboard_check_pressed(katsu_keys[i]), key_states_katsu[i])
	key_states_katsu[i] = clamp(key_states_katsu[i], 0,1)
}


// Check collision
var don_key_pressed = max(key_states_don[0], key_states_don[1], 0 );
var katsu_keys_pressed = max(key_states_katsu[0], key_states_katsu[1], 0 );



if(don_key_pressed == 1)
{
	checkNoteCollision([1,3]); // 1 and 3 are type don and DON
}
if(katsu_keys_pressed == 1)
{
	checkNoteCollision([2,4]); // 2 and 4...
}
ds_list_clear(next_notes_list);