/// @description Init variables
globalvar CELL_COEFFICIENT; // How far to spread out cells
CELL_COEFFICIENT = 2.0;

globalvar CURRENT_SPAWNX; // starting spawnx
CURRENT_SPAWNX =x;

globalvar SPAWN_MULTIPLIER; // 
SPAWN_MULTIPLIER = 15;

globalvar CURRENT_SCROLL_COEFFICIENT; // Note speed multiplier
CURRENT_SCROLL_COEFFICIENT = 1.0;


globalvar SONG_NAME, DIFFICULTY, BPM, TIME_OFFSET;

SONG_NAME = "n/a"; // Shown song name
DIFFICULTY = "n/a"; //string, "Oni"
TIME_OFFSET = 0; // 1 = start one second later (given by OFFSET data)
BPM = 180;// BPM of the song



SONGFILE = "Evidence of evil.ogg";

var result = loadTaikoMap("eoee.tja");

if(result)
{
	readTaikoMap()
	interpretTaikoMap()
	// Start audio
	instance_create_depth(0,0,0,obj_audiocontrol, {
		songfile : SONGFILE
	});
	
}

instance_create_layer(x,y,"Instances", obj_hitField)
