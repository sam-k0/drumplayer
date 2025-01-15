
// Visual
image_xscale = 1
image_yscale = 1


// Controls
don_keys = [ord("F"), ord("G")];
katsu_keys = [ord("J"), ord("K")];

// Array to store key states (0 = not pressed, 1 = pressed)
// This is also the alpha, so goes from 1 to 0 as used in drawing 
key_states_don = [0, 0];
key_states_katsu = [0,0];

// Note list
next_notes_list = ds_list_create();

function checkNoteCollision(type)
{
    var nearestNote = instance_nearest(x, y, obj_drumNote);
    if (nearestNote == noone) {
        return -1;
    }

    var dt = delta_time / 1000000 * 60;

    // Calculate a reasonable collision range
    var spd = nearestNote.scrollspeed;
    ds_list_clear(next_notes_list);
    collision_line_list(
        x - spd * 2 * dt, 
        y, 
        x + spd * 2 * dt, 
        y, 
        obj_drumNote, 
        false, 
        false, 
        next_notes_list, 
        true
    );

    // Debug message for testing
    show_debug_message(ds_list_size(next_notes_list));

    if (ds_list_size(next_notes_list) == 0) {
        return -1;
    }

    // Iterate all close notes
    for (var i = 0; i < ds_list_size(next_notes_list); i++) 
    {
        var note = ds_list_find_value(next_notes_list, i);

        // Ensure note is valid and active
        if (note != noone && note.active && array_contains(type, note.noteType)) 
        {
             note.isHit();	
           
        }
    }
}



// Get difficulty label
diff_subimg = 0;
switch(DIFFICULTY)
{
	case "Easy":
	diff_subimg = 0;
	break;
	
	case "Normal":
	diff_subimg = 1;
	break;
	
	
	case "Hard":
	diff_subimg = 2;
	break;
	
	case "Oni":
	diff_subimg = 3;
	break;
	
	default:
	show_debug_message("Assuming duff level 4");
	diff_subimg = 4
	break;
}