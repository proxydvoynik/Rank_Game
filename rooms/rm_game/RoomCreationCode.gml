if (global.current_topic_index == -1) {
    room_goto(rm_start); 
    exit;
}

var topic_idx = global.current_topic_index;
var order = global.topic_order[topic_idx];

var el0 = instance_find(obj_element, 0);
var el1 = instance_find(obj_element, 1);
var el2 = instance_find(obj_element, 2);
var el3 = instance_find(obj_element, 3);

el0.correct_index = order[0];
el1.correct_index = order[1];
el2.correct_index = order[2];
el3.correct_index = order[3];

show_debug_message("Topic " + string(topic_idx) + " loaded");


var start_positions = [100, 170, 240, 310];
start_positions = [start_positions[3], start_positions[0], start_positions[2], start_positions[1]]; // shuffle

var els = [instance_find(obj_element,0), instance_find(obj_element,1), instance_find(obj_element,2), instance_find(obj_element,3)];
for (var i=0; i<4; i++) {
    els[i].x = 400;
    els[i].y = start_positions[i];
}
show_debug_message("Elements shuffled");

// find submit button
var submit = noone;
with (obj_button) {
    if (action == "submit") {
        submit = id;
    }
}

if (submit == noone) {
    show_debug_message("ERROR: Submit button not found");
    exit;
}

// shuffle order (keep your shuffle)
var indices = [0, 1, 2, 3];
indices = [indices[3], indices[0], indices[2], indices[1]]; // your shuffle

var els = [
    instance_find(obj_element, indices[0]),
    instance_find(obj_element, indices[1]),
    instance_find(obj_element, indices[2]),
    instance_find(obj_element, indices[3])
];

// element size (assumes all elements same sprite)
var el = instance_find(obj_element, 0);
var el_width = sprite_get_bbox_right(el.sprite_index)
             - sprite_get_bbox_left(el.sprite_index);

// spacing = element width + padding
var padding = 24;
var spacing = el_width + padding;

// total width of 4 elements
var total_width = spacing * 3;

// starting x so row is centered above submit
var start_x = submit.x - total_width / 2;

var y_pos = submit.y - 110;

// position elements horizontally
for (var i = 0; i < 4; i++) {
    els[i].x = start_x + spacing * i;
    els[i].y = y_pos;

    // save staging position
    els[i].start_x = els[i].x;
    els[i].start_y = els[i].y;

    els[i].current_slot = noone;
}

show_debug_message("Elements positioned horizontally above submit");
