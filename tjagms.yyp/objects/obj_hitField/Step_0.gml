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