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
