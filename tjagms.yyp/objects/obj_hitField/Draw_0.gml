/// @description Draw drums and self
draw_self();
// drums
draw_sprite(spr_drumGame, 0, x-150,y);
// inputs
var combined_inputs = [];
array_push(combined_inputs, key_states_don[0], key_states_don[1], key_states_katsu[0], key_states_katsu[1]);

for(var i = 0; i < array_length(combined_inputs); i++)
{
	draw_sprite_ext(spr_drumGame, 1+i, x-150, y,1,1,0,c_white, combined_inputs[i]);
}

// diff
draw_sprite(spr_difficultyIcon, diff_subimg, x-300, y);
// combo
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(fnt_combo_gold);
draw_text_ext_transformed(x-150,y-64,combo, 0, 200,getComboScale(combo),1,0);

draw_set_halign(fa_left)
draw_set_valign(fa_top)