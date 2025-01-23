/// @description Discover songs

found_map_structs = find_map_files(working_directory + "/songs")

// Define box positions
boxes = [];
box_spacing = 192;
box_x_anchor = 544;
box_y_anchor = 192;
num_boxes = 7;
current_index = 0;
// Create boxes
for(var i = 0; i < num_boxes; i++)
{
    var _box = instance_create_layer(box_x_anchor, box_y_anchor + box_spacing*i, "Instances", obj_songBox);
    array_push(boxes, _box)
}

show_debug_message(boxes)

var num_found = array_length(found_map_structs);
// pad the array if found songs is less than 7
if(num_found < num_boxes)
{
    // repeat the songs
    for(var i = num_found; i < num_boxes; i++)
    {
        var acc = i%num_found;
        show_debug_message("padding {0} to {1}", found_map_structs[acc], i)
        array_push(found_map_structs, found_map_structs[acc]);
    }
}

// assign starting values
for(var i = 0; i < num_boxes; i++)
{
    var _box = boxes[i];
    var _struct = found_map_structs[i];
    _box.songtitle = _struct[$ "title"];
    _box.songsub = _struct[$ "subtitle"];
}