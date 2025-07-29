
#macro INPUT_CONFIG_PATH "input.ini" 
#macro AUTOPLAY true

globalvar SONGFILE, MAPFILE;

SONGFILE = "Evidence of evil.ogg";
MAPFILE = "Evidence of evil.tja";


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
		"KeyKatsuB": "K"
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

alarm_set(0,20)