show_debug_message("BUTTON CLICKED: " + string(action));
if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    
        if (action == "play") {
			scr_play_click();

    global.timer = 0;
    global.timer_running = true;
    room_goto(rm_topic_select);
}

    }
    
    if (action == "how_to_play") {
		scr_play_click();

        room_goto(rm_how_to_play);
    }
    
    if (action == "back_start") {
		scr_play_click();

        room_goto(rm_start);
    }
    
    if (action == "submit") {

		// check all slots are filled
var all_filled = true;

with (obj_slot) {
    if (held_element == noone) {
        all_filled = false;
    }
}

if (!all_filled) {
    show_debug_message("Submit blocked: not all slots filled");
    exit;
}
else{
	scr_play_click();
}


    var my_score = 0;
var correct_order = global.topic_order[global.current_topic_index];

// loop through all slots
with (obj_slot) {

    if (held_element != noone) {

        var expected = correct_order[slot_index];

        if (held_element.correct_index == expected) {
            my_score++;
            show_debug_message("Slot " + string(slot_index) + " correct");
        } else {
            show_debug_message(
                "Slot " + string(slot_index) +
                " wrong (got " + string(held_element.correct_index) +
                ", expected " + string(expected) + ")"
            );
        }
    }
}


    global.total_score += my_score * 25;
    show_debug_message("Score: " + string(my_score) + "/4");

    // mark current topic as completed
    if (global.current_topic_index != -1) {
        global.topics_done[global.current_topic_index] = true;
    }

    // check if all topics are done
    var all_done = true;
    for (var i = 0; i < array_length(global.topics_done); i++) {
        if (!global.topics_done[i]) {
            all_done = false;
            break;
        }
    }

    // decide where to go
    if (all_done) {
        global.timer_running = false;

        global.final_time_taken = floor(global.timer);
        global.final_time_bonus = max(
            0,
            floor((global.time_limit - global.timer) * 0.2)
        );

        room_goto(rm_results);
    } else {
        room_goto(rm_topic_select);
    }
}




if (action == "play_again") {
	scr_play_click();


    // reset timer
    global.timer = 0;

    // reset score
    global.total_score = 0;

    // reset topic completion
    for (var i = 0; i < array_length(global.topics_done); i++) {
        global.topics_done[i] = false;
    }

    // reset topic selection
    global.current_topic_index = -1;

    room_goto(rm_start);
}

