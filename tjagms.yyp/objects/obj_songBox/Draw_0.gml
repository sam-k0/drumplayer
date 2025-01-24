if(!show)
{
    exit;
}
draw_set_font(fnt_trad_32)
draw_set_halign(fa_center)
draw_set_valign(fa_top)

var sprh = sprite_get_height(sprite_index)

draw_self()

draw_text(x,y-sprh/3,songtitle)
draw_set_valign(fa_bottom)

draw_set_font(fnt_trad_24)
draw_text(x,y+sprh/3, songsub);


draw_set_halign(fa_left)
draw_set_valign(fa_top)