
#macro INPUT_CONFIG_PATH "input.ini" 

globalvar SONGFILE, MAPFILE, AUTOPLAY, ONLINE_MODE, DEBUG_MODE, SELECTED_DIFF;

SONGFILE = "";
MAPFILE = "";
SELECTED_DIFF = "";
AUTOPLAY = true;
ONLINE_MODE = false;
DEBUG_MODE = false;

// Check if the file exists, if not, create default mappings for keys
if (!file_exists(INPUT_CONFIG_PATH)) {
	ini_open(INPUT_CONFIG_PATH)

	ini_write_string("Input", "KeyDonA", "F")
	ini_write_string("Input", "KeyDonB", "G")
	ini_write_string("Input", "KeyKatsuA", "J")
	ini_write_string("Input", "KeyKatsuB", "K")

	global.input_keys = {
		"KeyDonA": "F",
		"KeyDonB": "G",
		"KeyKatsuA": "J",
		"KeyKatsuB": "K",
	}
	ini_close()
	
	show_debug_message($"{INPUT_CONFIG_PATH} file not found, created new one.")
}
else {
	ini_open(INPUT_CONFIG_PATH)

	global.input_keys = {
		"KeyDonA": ini_read_string("Input", "KeyDonA", "F"),
		"KeyDonB": ini_read_string("Input", "KeyDonB", "G"),
		"KeyKatsuA": ini_read_string("Input", "KeyKatsuA", "J"),
		"KeyKatsuB": ini_read_string("Input", "KeyKatsuB", "K")
	}
	ini_close()
}

show_debug_message($"{global.input_keys} assigned." )

controlvis_step = 0
alarm[0] = game_get_speed(0) * 3