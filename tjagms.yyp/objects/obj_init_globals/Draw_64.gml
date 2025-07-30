draw_set_font(fnt_trad_24)
draw_set_color(c_white)
draw_set_halign(fa_center)

draw_text(camera_get_view_width(camera_get_active())/2, 64, "Welcome to drumplayer for TJA!")

var inputKeyArr = [(global.input_keys.KeyDonA), (global.input_keys.KeyDonB), (global.input_keys.KeyKatsuA), (global.input_keys.KeyKatsuB)]

draw_sprite(spr_drumGame, 0, camera_get_view_width(camera_get_active())/2, camera_get_view_height(camera_get_active())/2)
draw_sprite(spr_drumGame, controlvis_step+1, camera_get_view_width(camera_get_active())/2, camera_get_view_height(camera_get_active())/2)
draw_text(camera_get_view_width(camera_get_active())/2 , camera_get_view_height(camera_get_active())/2+100, "Input Demonstration: " + inputKeyArr[controlvis_step])
draw_text(camera_get_view_width(camera_get_active())/2, camera_get_view_height(camera_get_active())/2-150, "Game Setup")
draw_text(
    camera_get_view_width(camera_get_active())/2,
    camera_get_view_height(camera_get_active())/2+200,
    $"{inputKeyArr[0]}: Toggle Autoplay (Currently {AUTOPLAY ? "On" : "Off"})\n{inputKeyArr[1]}: Online Mode (Currently {ONLINE_MODE ? "On" : "Off"})\n{inputKeyArr[2]}: Debug Mode (Currently {DEBUG_MODE ? "On" : "Off"})\n{inputKeyArr[3]}: Confirm Settings and Start Game"
    )

