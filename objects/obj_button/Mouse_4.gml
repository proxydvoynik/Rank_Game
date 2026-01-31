show_debug_message("BUTTON CLICKED: " + string(action));
if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    
    if (action == "play") {
        if (action == "play") {
    global.timer = 0;
    global.timer_running = true;
    room_goto(rm_topic_select);
}

    }
    
    if (action == "how_to_play") {
        room_goto(rm_how_to_play);
    }
    
    if (action == "back_start") {
        room_goto(rm_start);
    }
    
    if (action == "submit") {

    var els = [noone, noone, noone, noone];

    // collect elements by vertical slot
    with (obj_element) {
        var pos = round((y - 100) / 70);
        if (pos >= 0 && pos < 4) {
            els[pos] = id;
        }
    }

    var my_score = 0;
    var correct_order = global.topic_order[global.current_topic_index];

    for (var i = 0; i < 4; i++) {
        if (els[i] != noone && els[i].correct_index == correct_order[i]) {
            my_score++;
            show_debug_message("Pos " + string(i) + " correct");
        }
    }

    global.total_score += my_score * 25;
    show_debug_message("Score: " + string(my_score) + "/4");

    // 🔴 MARK CURRENT TOPIC AS COMPLETED
    if (global.current_topic_index != -1) {
        global.topics_done[global.current_topic_index] = true;
    }

    // 🔴 CHECK IF ALL TOPICS ARE DONE
    var all_done = true;
    for (var i = 0; i < array_length(global.topics_done); i++) {
        if (!global.topics_done[i]) {
            all_done = false;
            break;
        }
    }

    // 🔴 DECIDE WHERE TO GO
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

}
