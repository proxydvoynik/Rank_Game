// use stored padding
var pad_x = visual_pad_x;
var pad_y = visual_pad_y;

// calculate visual rect
var left   = bbox_left   - pad_x;
var right  = bbox_right  + pad_x;
var top    = bbox_top    - pad_y;
var bottom = bbox_bottom + pad_y;

// optional hover highlight (border color)
var hovered = false;
with (obj_element) {
    if (dragging && point_in_rectangle(
        mouse_x,
        mouse_y,
        other.bbox_left,
        other.bbox_top,
        other.bbox_right,
        other.bbox_bottom
    )) {
        hovered = true;
    }
}

if (hovered) {
    draw_set_color(c_blue);
} else {
    draw_set_color(c_black);
}

// draw border only
draw_roundrect(left, top, right, bottom, true);

// reset draw state
draw_set_color(c_white);
