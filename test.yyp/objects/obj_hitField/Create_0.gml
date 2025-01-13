/// @description Init variables
globalvar CELL_COEFFICIENT; // How far to spread out cells
CELL_COEFFICIENT = 2.0;

globalvar CURRENT_SPAWNX; // starting spawnx
CURRENT_SPAWNX = 0;

globalvar SPAWN_MULTIPLIER; // 
SPAWN_MULTIPLIER = 10;

globalvar CURRENT_SCROLL_COEFFICIENT; // Note speed multiplier
CURRENT_SCROLL_COEFFICIENT = 1.0;


globalvar SONG_NAME, DIFFICULTY, BPM, TIME_OFFSET;

SONG_NAME = "n/a"; // Shown song name
DIFFICULTY = "n/a"; // unused
TIME_OFFSET = 0; // 1 = start one second later
BPM = 0;// BPM of the song


SONGFILE = "Evidence of evil.ogg";

var result = loadTaikoMap();

if(result)
{
	readTaikoMap()
	interpretTaikoMap()
	// Start audio
	instance_create_depth(0,0,0,obj_audiocontrol, {
		songfile : SONGFILE
	});
	
}

// Visual
image_xscale = 0.5
image_yscale = 0.5


// Controls
don_keys = [ord("F"), ord("G")];
katsu_keys = [ord("J"), ord("K")];

// Array to store key states (0 = not pressed, 1 = pressed)
// This is also the alpha, so goes from 1 to 0 as used in drawing 
key_states_don = [0, 0];
key_states_katsu = [0,0];
