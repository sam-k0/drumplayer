/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
globalvar CELL_COEFFICIENT;
CELL_COEFFICIENT = 1.5

globalvar CURRENT_SPAWNX;
CURRENT_SPAWNX = 60;

globalvar SPAWN_MULTIPLIER;
SPAWN_MULTIPLIER = 6;

globalvar CURRENT_SCROLL_COEFFICIENT;
CURRENT_SCROLL_COEFFICIENT = 1.0;


globalvar SONG_NAME, DIFFICULTY, BPM, TIME_OFFSET;

SONG_NAME = "n/a";
DIFFICULTY = "n/a";
TIME_OFFSET = 1;
BPM = 0;

var result = loadTaikoMap();

if(result)
{
	readTaikoMap()
	interpretTaikoMap()
}