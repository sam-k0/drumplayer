/// Control Settings

if(keyboard_check_pressed(ord(global.input_keys.KeyDonA)))
{
    AUTOPLAY = !AUTOPLAY;
}

if(keyboard_check_pressed(ord(global.input_keys.KeyDonB)))
{
    ONLINE_MODE = !ONLINE_MODE;
}

if(keyboard_check_pressed(ord(global.input_keys.KeyKatsuA)))    
{
    DEBUG_MODE = !DEBUG_MODE;
    show_debug_message("Debug Mode " + (DEBUG_MODE ? "Enabled" : "Disabled"));
    show_debug_log(DEBUG_MODE);
}

if(keyboard_check_pressed(ord(global.input_keys.KeyKatsuB)))
{
    // Confirm Settings and Start Game
    room_goto(rm_songselect);
    show_debug_message("Settings confirmed. Starting game...");
}
