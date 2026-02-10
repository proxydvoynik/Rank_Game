
show_debug_message("BUTTON CLICKED: " + string(action));

// block input during transition
if (instance_exists(obj_transition) && obj_transition.state != "idle") exit;

// check click inside button
if (!point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) exit;

// helper: start transition safely
function go_to_room(_room) {
    if (!instance_exists(obj_transition)) {
        instance_create_layer(0, 0, "Instances", obj_transition);
    }
    with (obj_transition) {
        target_room = _room;
        state = "fade_out";
    }
}

// --------------------------------------------------
// PLAY
// --------------------------------------------------
if (action == "play") {
    scr_play_click();
	
	if(!audio_is_playing(snd_bgm)){
		audio_play_sound(snd_bgm,0,true);
	}

    global.timer = 0;
    global.timer_running = true;

    go_to_room(rm_topic_select);
    exit;
}

// --------------------------------------------------
// HOW TO PLAY
// --------------------------------------------------
if (action == "how_to_play") {
    scr_play_click();
    go_to_room(rm_how_to_play);
    exit;
}

// --------------------------------------------------
// BACK TO START
// --------------------------------------------------
if (action == "back_start") {
    scr_play_click();
    go_to_room(rm_start);
    exit;
}

// --------------------------------------------------
// SUBMIT
// --------------------------------------------------
if (action == "submit") {

    // ---------------------------------
    // CHECK ALL SLOTS FILLED
    // ---------------------------------
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

    scr_play_click();

    // ---------------------------------
    // DEBUG + SCORE CALCULATION
    // ---------------------------------
    var my_score = 0;
    var topic = global.current_topic_index;
    var correct_order = global.topic_order[topic];

    show_debug_message("===== SUBMIT DEBUG START =====");
    show_debug_message("Topic index: " + string(topic));
    show_debug_message("Correct order: " + string(correct_order));

    with (obj_slot) {

        if (held_element == noone) {
            show_debug_message("Slot " + string(slot_index) + " EMPTY");
            exit;
        }

        var expected = correct_order[slot_index];
        var got = held_element.correct_index;

        show_debug_message(
            "Slot " + string(slot_index) +
            " | expects: " + string(expected) +
            " | got: " + string(got) +
            " | label: " + held_element.label
        );

        if (got == expected) {
            my_score++;
            show_debug_message("→ CORRECT");
        } else {
            show_debug_message("→ WRONG");
        }
    }

    show_debug_message("FINAL SCORE: " + string(my_score) + "/4");
    show_debug_message("===== SUBMIT DEBUG END =====");

    global.total_score += my_score * 25;

    // ---------------------------------
    // MARK TOPIC DONE
    // ---------------------------------
    if (topic != -1) {
        global.topics_done[topic] = true;
    }

    // ---------------------------------
    // CHECK IF ALL TOPICS DONE
    // ---------------------------------
    var all_done = true;
    for (var i = 0; i < array_length(global.topics_done); i++) {
        if (!global.topics_done[i]) {
            all_done = false;
            break;
        }
    }

    // ---------------------------------
    // GO TO NEXT ROOM
    // ---------------------------------
    if (all_done) {
        global.timer_running = false;

        global.final_time_taken = floor(global.timer);
        global.final_time_bonus = max(
            0,
            floor((global.time_limit - global.timer) * 0.2)
        );

        go_to_room(rm_results);
    } else {
        go_to_room(rm_topic_select);
    }

    exit;
}


// --------------------------------------------------
// PLAY AGAIN
// --------------------------------------------------
if (action == "play_again") {
    scr_play_click();

    global.timer = 0;
    global.total_score = 0;

    for (var i = 0; i < array_length(global.topics_done); i++) {
        global.topics_done[i] = false;
    }

    global.current_topic_index = -1;

    go_to_room(rm_start);
    exit;
}
