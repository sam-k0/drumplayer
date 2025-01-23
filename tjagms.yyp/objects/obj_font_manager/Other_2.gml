// Create fonts
globalvar fnt_trad_24, fnt_trad_32, fnt_combo_gold;
//fnt_trad = font_add_sprite(spr_fnt_trad, ord("!"), true, 2);
fnt_trad_24 = font_add("traditional.ttf", 24,false, false, 32, 128);
fnt_trad_32 = font_add("traditional.ttf", 32,false, false, 32, 128);
fnt_combo_gold = font_add_sprite_ext(spr_fnt_combo, "0123456789", true, 2);