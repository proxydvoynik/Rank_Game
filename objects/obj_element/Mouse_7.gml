dragging = false;

var slot = instance_position(mouse_x, mouse_y, obj_slot);

if (slot != noone) {

    // if slot already has an element → swap
    if (slot.held_element != noone) {

        var other_el = slot.held_element;

        // move other element to this element's previous place
        if (current_slot != noone) {

            // align other element to previous slot's visual area
            other_el.x += (current_slot.bbox_left + current_slot.visual_pad_x) - other_el.bbox_left;
            other_el.y += (current_slot.bbox_top  + current_slot.visual_pad_y) - other_el.bbox_top;

            current_slot.held_element = other_el;
            other_el.current_slot = current_slot;

        } else {
            // move other element back to staging
            other_el.x = other_el.start_x;
            other_el.y = other_el.start_y;
            other_el.current_slot = noone;
        }
    }

    // free old slot of this element
    if (current_slot != noone) {
        current_slot.held_element = noone;
    }

    // snap THIS element to new slot's visual area (bbox-aligned)
   x += (slot.bbox_left - slot.visual_pad_x) - bbox_left;
y += (slot.bbox_top  - slot.visual_pad_y) - bbox_top;


    slot.held_element = id;
    current_slot = slot;

} else {
    // no slot → return to staging
    x = start_x;
    y = start_y;
}
