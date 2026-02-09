// -------------------------------------------------
// SAFETY CHECK
// -------------------------------------------------
if (global.current_topic_index == -1) {
    room_goto(rm_start);
    exit;
}

var topic = global.current_topic_index;

// -------------------------------------------------
// CLEAN UP OLD ELEMENTS
// -------------------------------------------------
with (obj_element) {
    instance_destroy();
}

// -------------------------------------------------
// GET TOPIC DATA
// -------------------------------------------------
var names = global.topic_elements[topic];

// -------------------------------------------------
// FIND SUBMIT BUTTON
// -------------------------------------------------
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

// -------------------------------------------------
// CREATE ELEMENTS
// -------------------------------------------------
var elements = [];

for (var i = 0; i < 4; i++) {
    var el = instance_create_layer(0, 0, "Instances", obj_element);

    el.label = names[i];     // topic-specific text
    el.correct_index = i;    // identity (used in scoring)
    el.current_slot = noone;

    array_push(elements, el);
}

// -------------------------------------------------
// SHUFFLE VISUAL ORDER
// -------------------------------------------------
array_shuffle(elements);

// -------------------------------------------------
// CALCULATE HORIZONTAL LAYOUT
// -------------------------------------------------
var el_width = elements[0].bbox_right - elements[0].bbox_left;

var padding = 24;
var spacing = el_width + padding;
var total_width = spacing * 3;

// center row above submit button
var start_x = submit.x - total_width / 2;
var y_pos   = submit.y - 110;

// -------------------------------------------------
// POSITION ELEMENTS
// -------------------------------------------------
for (var i = 0; i < 4; i++) {
    var el = elements[i];

    el.x = start_x + spacing * i;
    el.y = y_pos;

    el.start_x = el.x;
    el.start_y = el.y;
}

show_debug_message("Topic " + string(topic) + " elements created and positioned");
