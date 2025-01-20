/// @description Draw Info
draw_set_font(fnt_trad_32);

var vw = camera_get_view_width(view_camera[0]);
var titleoff = 32  // offset for title text from right side of screen
var genlblw = 288; // width of the sprite
var genlbloff = 32; // offset
var bpmbgw = 168;
var bpmbgoff = 32;
// get ready to draw the song title
draw_set_halign(fa_right)
draw_text(vw-titleoff ,32,SONG_NAME);

// Draw subtitle
draw_set_font(fnt_trad_24);
draw_text(vw-titleoff, 75, SUBTITLE);

// Draw BPM
draw_set_halign(fa_center) // Set halign
draw_set_valign(fa_middle)
var drumscale = max(0,sin(current_time*0.01)*0.2);
draw_sprite_ext(spr_drumGame, 0, vw-bpmbgw/2 - bpmbgoff, 200+64, 0.7+drumscale,0.7+drumscale, 0,c_white, 1)

draw_text_color(vw-bpmbgw/2 - bpmbgoff, 180+64, "BPM\n"+string(BPM), c_black, c_black, c_black, c_black, 1.0);

// draw genre badge
// usign halign and valign from BPM!

draw_set_font(-1) // default font for now
draw_sprite(spr_genrelabel, 0, vw - genlblw * 0.5 - genlbloff, 120+16)
draw_text(vw - genlblw*0.5 - genlbloff, 120+16, "Game Music");


draw_set_halign(fa_left);
