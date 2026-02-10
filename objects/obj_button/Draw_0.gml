draw_self();


// --------------------
// TEXT BUTTONS
// --------------------
draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// calculate size safely
var bw = bbox_right - bbox_left;
var bh = bbox_bottom - bbox_top;

draw_text(
    x + bw / 2,
    y + bh / 2,
    label
);

// reset draw state
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
