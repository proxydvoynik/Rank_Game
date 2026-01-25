if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    dragging = true;
    drag_offset_x = mouse_x - x;
    drag_offset_y = mouse_y - y;
}
