/// @description Init variables
// You can write your code in this editor
globalvar CELL_COEFFICIENT; // How far to spread out cells
CELL_COEFFICIENT = 2.0;

globalvar CURRENT_SPAWNX; // starting spawnx
CURRENT_SPAWNX =x;

globalvar SPAWN_MULTIPLIER; // 
SPAWN_MULTIPLIER = 15;

globalvar CURRENT_SCROLL_COEFFICIENT; // Note speed multiplier
CURRENT_SCROLL_COEFFICIENT = 1.0;

globalvar SONG_NAME, DIFFICULTY, BPM, TIME_OFFSET, SUBTITLE;

SONG_NAME = "n/a"; // Shown song name (TITLE data)
DIFFICULTY = "n/a"; //string, "Oni" (COURSE data)
TIME_OFFSET = 0; // 1 = start one second later (given by OFFSET data)
SUBTITLE = ""; // SUBTITLE field. --/++ modifier is removed
BPM = 180;// BPM of the song


globalvar TIME_OFFSET_STATIC;
TIME_OFFSET_STATIC = 2*60;// Frame offset to move notes further back (flat offset not affected by meta)
// local variables
show_debug_log(true)

// Search songfiles
show_debug_message("Reading from {0}", MAPFILE)
var result = loadTaikoMap(MAPFILE);

if(result)
{
	readTaikoMap()
	interpretTaikoMap(TIME_OFFSET_STATIC);
	// Start audio
	instance_create_depth(0,0,0,obj_audiocontrol, {
		songfile : SONGFILE,
		time_offset : TIME_OFFSET_STATIC
	});
	
}

instance_create_layer(x,y,"Instances", obj_hitField)
