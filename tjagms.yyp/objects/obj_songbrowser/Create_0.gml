/// @description Discover songs

found_map_structs = find_map_files(working_directory + "/songs")

// Define box positions
boxes = [];
box_spacing = 200;
box_x_anchor = 544;
box_y_anchor = -300;
num_boxes = 8;
current_index = 0;
max_index = array_length(found_map_structs)-1;

// Controls
up_scroll_keys = [ord("F"), ord("G")]
down_scroll_keys = [ord("J"), ord("K")]

u_time = shader_get_uniform(shd_rainbow, "time")



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

function update_box_positions() {
    for (var i = 0; i < array_length(boxes); i++) {
        var _box = boxes[i];
        _box.target_y = box_y_anchor + box_spacing * i; // Set the new target position
    }
}


// Define functions
function scroll_up() {
    // Pop the first box
    var box_to_reuse = array_shift(boxes);

    // Move it to the end
    array_push(boxes, box_to_reuse);

    // Update the `current_index`
    current_index = (current_index + 1) % array_length(found_map_structs);

    // Assign new song data to the reused box
    var next_song_index = (current_index + num_boxes - 1) % array_length(found_map_structs);
    box_to_reuse.songtitle = found_map_structs[next_song_index][$ "title"];
    box_to_reuse.songsub = found_map_structs[next_song_index][$ "subtitle"];
    box_to_reuse.show = false;

    update_box_positions()
}

function scroll_down() {
    // Pop the last box
    var box_to_reuse = array_pop(boxes);

    // Insert it at the front
    array_insert(boxes, 0, box_to_reuse);

    // Update the `current_index`
    current_index = (current_index - 1 + array_length(found_map_structs)) % array_length(found_map_structs);

    // Assign new song data to the reused box
    var prev_song_index = current_index;
    box_to_reuse.songtitle = found_map_structs[prev_song_index][$ "title"];
    box_to_reuse.songsub = found_map_structs[prev_song_index][$ "subtitle"];
    box_to_reuse.show = false;
    
    update_box_positions()
}