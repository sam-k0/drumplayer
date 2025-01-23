function input_by_arr(arr)
{
    for (var __i = 0; __i < array_length(arr); __i++) {
    	if(keyboard_check_pressed(arr[__i]))
    	{
    	    return true;
    	}
    }
    return false;
}