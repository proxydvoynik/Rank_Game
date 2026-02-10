dragging = true;
drag_offset_x = mouse_x - x;
drag_offset_y = mouse_y - y;

// free old slot if any
if (current_slot != noone) {
    current_slot.held_element = noone;
    current_slot = noone;
}
