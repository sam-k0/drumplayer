
function loadTaikoMap()
{ // Opens a tja file for reading
	globalvar MAP_FILE_NAME;
	globalvar MAP_FILE_ID;


	MAP_FILE_NAME = "Evidence of evil.tja"
	if(MAP_FILE_NAME != "")
	{
		MAP_FILE_ID=file_text_open_read(MAP_FILE_NAME);
		return true;
	}
	return false;
}

function calcCellLen(__lower)
{
	var __cellLen;
	__cellLen = (CELL_COEFFICIENT*(4/__lower));
	return __cellLen;
}

function calcRowLen(__upper, __cellLen)
{
	return __upper*__cellLen
}

function calcNoteDist(__cellLen, __rowNoteCount, __upper)
{
	return __cellLen/(__rowNoteCount/__upper);
}


function calcNoteScrollSpeed_old(__rowlen_px,__upper, __bpm)
{
	var pxperbeat =  __rowlen_px / __upper // row length in px / number of beats
	var pxperframe = pxperbeat * __bpm // moving px per game frame assuming 60fps
	return pxperframe * CURRENT_SCROLL_COEFFICIENT;
}

function calcNoteScrollSpeed(__rowlen_px, __upper, __bpm)
{
    // Calculate the number of beats per second
    var beats_per_second = __bpm / 60;  // BPM to beats per second

    // Calculate pixels per beat
    var pxperbeat = __rowlen_px / __upper; // row length in pixels / beats per row

    // Calculate pixels moved per second
    var pxpersecond = beats_per_second * pxperbeat; // pixels per second

    // Calculate pixels per frame (assuming 60 fps)
    var pxperframe = pxpersecond / 60;  // divide by 60 to get per frame (fps = 60)

    // Apply the scroll coefficient (assuming CURRENT_SCROLL_COEFFICIENT is defined)
    return pxperframe * 1//CURRENT_SCROLL_COEFFICIENT;  // apply the coefficient
}


function readTaikoMap() // Reads contents of the tja file opened
{
	// Read from the tja file
	globalvar TJA_ARRAY;
	TJA_ARRAY = array_create(1)
	var i = 0;

	// Transfer contents to the TJA ARRAY
	while(!file_text_eof(MAP_FILE_ID))
	{
		// Increase array size
		if(array_length(TJA_ARRAY) > i)
		{
			temparr = array_create(i+1)
			array_copy(temparr,0,TJA_ARRAY,0,i+1)
		}
	
	
	    TJA_ARRAY[i] = file_text_read_string(MAP_FILE_ID);
	    file_text_readln(MAP_FILE_ID);
		i++;
	}

	// Debug: Print map
	for(i = 0; i<array_length(TJA_ARRAY);i++)
	{
		show_debug_message(string(i) + " : "+string(TJA_ARRAY[i]))
	}

}

function getTaikoCommand(linestr)
{
	/*
	0 = Normal taiko data
	1 = START
	2 = BPMCHANGE
	3 = MEASURE
	4 = SCROLL
	*/
	//show_debug_message(linestr)
	var llen = string_length(linestr); // get string length
	
	
	if(llen == 6 && string_copy(linestr,2,5) == "START") // Start command?
	{
		return 1;
	}
	
	if(llen >= 10 && string_copy(linestr,2,9) == "BPMCHANGE")
	{
		return 2;
	}
	
	if(llen >= 8 && string_copy(linestr,2,7) == "MEASURE")
	{
		return 3;
	}
	
	if(llen >= 7 && string_copy(linestr,2,6) == "SCROLL")
	{
	    return 4;
	}
	
	return 0; // its raw data
	
	
}

function handleTaikoCmd(linestr, command)
{
	switch(command)
	{
		case 0: // Data
		var arg = "";
		return arg;
		break;
		
		case 1: // Start
		return "-1";
		break;
		
		case 2: // #BPMCHANGE (args)
		var arg = string_replace(linestr, "#BPMCHANGE ","");
		return arg;
		break;		
		
		case 3: // #MEASURE (args)
		var arg = string_replace(linestr, "#MEASURE ","");
		//show_debug_message(arg)
		return arg; // Will return sth like "2/4"
		
		case 4: // #SCROLL (arg)
		return string_replace(linestr, "#SCROLL ", ""); // returns arg as str
		break;		
		
	}
}

function interpretTaikoMap()
{
	var rowCount = 1;	
	var currUpper = 4; // Assuming 4/4 measure
	var currLower = 4;
	var currBPM = BPM; // Gets set in bottom, this is just placeholder
	
	// Loop through the whole TJA Array storing the contents of the TJA file

	show_debug_message("TJA ARRAY....")
	for(var i = 0; i<array_length(TJA_ARRAY)-1; i++)
	{
		var line;
		line = TJA_ARRAY[i];

		// Get if current line is raw data or a command
	
		if(string_char_at(line,0) == "#")
		{
			// it is a command
			var cmd = getTaikoCommand(line); // get the cmd
			var cmdarg = handleTaikoCmd(line,cmd); // get the args
		
			switch(cmd)
			{
				case 1: // START
				if(rowCount == 0)
				{
					rowCount ++;
				}
				show_debug_message("--> START: "+cmdarg);
			
				break;
			
				case 2: // BPMCHANGE
					show_debug_message("--> BPMCHANGE: "+cmdarg);
					//var inst = instance_create_depth(CURRENT_SPAWNX,y-16,1,obj_noteRow);
					//inst.text = "BPM: "+string(cmdarg);
					currBPM = cmdarg;
				break;
			
				case 3: // MEASURE
				{
					// Get the components
					var _len = string_length(cmdarg);
					var _upper = "";
					var _lower = "";
					show_debug_message("Line 151: Cmdarg: "+cmdarg + "|| len: "+string(_len))
			
					var _iterator = 1;
					var slashfound = false;
					while(_iterator < _len+1)
					{
						if(string_char_at(cmdarg,_iterator) == "/")
						{
							// Do stuff
							slashfound = true;
							_iterator ++;
						}
						else
						{
							/// Assign values
							switch(slashfound)
							{
								case false:
								_upper = _upper + string_char_at(cmdarg,_iterator);
								break;
						
								case true:
								_lower = _lower + string_char_at(cmdarg,_iterator);
								break;
							}					
							_iterator ++;
						}
					}
					currLower = _lower;
					currUpper = _upper;
			
					show_debug_message("--> MEASURE: "+currUpper+"/"+currLower)
					
				}
				break;
				
				case 4: // SCROLL
					CURRENT_SCROLL_COEFFICIENT = real(cmdarg);
				break;	
		
			}
		}
		else // its not a command#region Data
		{
			// Is it data?
			if(string_char_at(line,string_length(line)) == ",") // Checks if line ends with ,
			{
				// create row note
				//var inst = instance_create_depth(CURRENT_SPAWNX,y,1,obj_noteRow);
				//inst.text = string(rowCount);
			
				// Data row
				var rawNotes = string_replace_all(line,",",""); // Delete all , from line to get note types
				if(rawNotes == "")
				{
					rawNotes = "0"
				}
				var noteCount = max(string_length(rawNotes),1);
			
			
				var cellLen = calcCellLen(currLower)*SPAWN_MULTIPLIER; // Doesnt rely on notes
				var noteDist = calcNoteDist(cellLen,noteCount,currUpper)*SPAWN_MULTIPLIER;
				//show_debug_message("Calling calcRoWLen {0}, {1} ", currUpper, cellLen);
				var rowLenPx = (real(currUpper) * real(cellLen)) * SPAWN_MULTIPLIER;
				
				show_debug_message("calcNoteScrollSpeed({0}, {1}, {2}) and COEFF {3}", rowLenPx, currUpper, currBPM, CURRENT_SCROLL_COEFFICIENT );
				
				// Calc scroll speed
				var noteScrollSpeed = calcNoteScrollSpeed(rowLenPx, currUpper, currBPM);
			
			
				show_debug_message(" CurrentSpawnx: {0}, cellLen {1}, noteDist {2} currUpper: {3} noteCount {4} spawnmult {5} scrollspd {6}", CURRENT_SPAWNX, cellLen, noteDist, currUpper, noteCount, SPAWN_MULTIPLIER, noteScrollSpeed);
			
			
				// Iterate all notes
				for(var n = 0; n < noteCount; n++) // each note in the string
				{
					var noteTypeChar = string_char_at(rawNotes,n+1);
					
					if(noteTypeChar == "") // if empty (aka, empty row -> disregard)
					{
						continue;
					}
					
					var varStruct = { // Common variables
					    scrollspeed: noteScrollSpeed
					};
					
					// Determine note properties
					var imageScale = (noteTypeChar == "3" || noteTypeChar == "4") ? 1.2 : 1.0;
					var spriteIndex = (noteTypeChar == "1" || noteTypeChar == "3") ? spr_noteRedSmall : spr_noteBlueSmall;
					var hitSound = (noteTypeChar == "1" || noteTypeChar == "3") ? snd_don : snd_katsu;
					
					// Assign to struct
					varStruct[$ "image_xscale"] = imageScale;
					varStruct[$ "image_yscale"] = imageScale;
					varStruct[$ "sprite_index"] = spriteIndex;
					varStruct[$ "hitsound"] = hitSound;
					
					// Create the instance
					if (noteTypeChar == "1" || noteTypeChar == "2" || noteTypeChar == "3" || noteTypeChar == "4") {
					    instance_create_depth(CURRENT_SPAWNX, y, 0, obj_drumNote, varStruct);
					}
				
					CURRENT_SPAWNX = CURRENT_SPAWNX+noteDist
				}
				rowCount += 1;			
			}
	
			// Static data
			if(string_copy(line,1,5) == "TITLE")
			{
				SONG_NAME = string_trim(string_replace(line,"TITLE:",""));
			}
			
			if(string_copy(line,1,3) == "BPM")
			{
				BPM = real(string_replace(line,"BPM:",""));
				currBPM = BPM;
			}
			
			if(string_copy(line, 1,6) == "OFFSET")
			{
				TIME_OFFSET = real(string_replace(line, "OFFSET:",""))*-1;
			}
			
			if(string_copy(line, 1,6) == "COURSE")
			{
				DIFFICULTY = string_trim(string_replace(line, "COURSE:","")) 
			}
		}
	}
}


