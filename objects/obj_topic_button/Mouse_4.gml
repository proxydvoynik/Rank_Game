if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    show_debug_message("Clicked topic " + string(index) + ", done=" + string(global.topics_done[index]));
    
    if (!global.topics_done[index]) {
        global.current_topic_index = index;
        global.topics_done[index] = true;
        show_debug_message("MARKED topic " + string(index) + " as done");
        room_goto(rm_game);
    } else {
        show_debug_message("Topic " + string(index) + " already done");
    }
}
