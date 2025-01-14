
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

// Draw difficulty label

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