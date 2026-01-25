if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    
    if (action == "play") {
        global.timer = 0;
        room_goto(rm_topic_select);
    }
    
    if (action == "how_to_play") {
        room_goto(rm_how_to_play);
    }
    
    if (action == "back_start") {
        room_goto(rm_start);
    }
    
    if (action == "submit") {
    
    var els = [noone, noone, noone, noone];
    
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
            show_debug_message("Pos " + string(i) + " correct: " + string(els[i].correct_index));
        }
    }
    
    global.total_score += my_score * 25;
    show_debug_message("Score: " + string(my_score) + "/4");
    room_goto(rm_topic_select);
}




}
