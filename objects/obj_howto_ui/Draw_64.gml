var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// -----------------------------
// BACKGROUND PANEL
// -----------------------------
draw_set_alpha(0.7);
draw_set_color(c_white);

draw_roundrect(
    gui_w * 0.1,
    gui_h * 0.15,
    gui_w * 0.9,
    gui_h * 0.7,
    false
);

draw_set_alpha(1);
draw_set_color(c_black);

// -----------------------------
// TITLE
// -----------------------------
draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(gui_w / 2, gui_h * 0.22, "HOW TO PLAY");

// -----------------------------
// INSTRUCTIONS
// -----------------------------
draw_set_font(fnt_button);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var text_x = gui_w * 0.18;
var text_y = gui_h * 0.30;
var line_gap = 36;

draw_text(text_x, text_y + line_gap * 0, "1. Choose a topic.");
draw_text(text_x, text_y + line_gap * 1, "2. Drag items into the slots.");
draw_text(text_x, text_y + line_gap * 2, "3. Arrange them from left to right.");
draw_text(text_x, text_y + line_gap * 3, "4. Each correct position gives points.");
draw_text(text_x, text_y + line_gap * 4, "5. Finish all topics before time runs out.");

// -----------------------------
// RESET DRAW STATE
// -----------------------------
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
