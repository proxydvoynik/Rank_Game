if (dragging) {
    x = mouse_x - drag_offset_x;
    y = mouse_y - drag_offset_y;
}

if (!dragging && current_slot == noone) {
    x = lerp(x, start_x, 0.25);
    y = lerp(y, start_y, 0.25);
}
