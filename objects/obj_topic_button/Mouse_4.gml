// block input during transition
if (instance_exists(obj_transition) && obj_transition.state != "idle") exit;

// check click inside button
if (!point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) exit;

// block click if topic already completed
if (global.topics_done[index]) {
    show_debug_message("Topic " + string(index) + " already done");
    exit;
}

// play click sound
scr_play_click();

// select topic (DO NOT mark as done here)
global.current_topic_index = index;

show_debug_message("Selected topic " + string(index));

// helper: start transition
function go_to_room(_room) {
    if (!instance_exists(obj_transition)) {
        instance_create_layer(0, 0, "Instances", obj_transition);
    }
    with (obj_transition) {
        target_room = _room;
        state = "fade_out";
    }
}

// go to game room with fade
go_to_room(rm_game);
