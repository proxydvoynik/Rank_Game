var topic = global.current_topic_index;
if (topic < 0) exit;

// -------------------------------------------------
// DATA
// -------------------------------------------------
var question    = global.topic_questions[topic];
var left_label  = global.topic_extremes[topic][0];
var right_label = global.topic_extremes[topic][1];

// screen sizes
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// -------------------------------------------------
// TITLE / QUESTION (TOP CENTER)
// -------------------------------------------------
draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_alpha(1);

// title position
draw_text(gui_w / 2, 40, string_upper(question));

// -------------------------------------------------
// SUPERLATIVES (MID LEFT / MID RIGHT)
// -------------------------------------------------
var mid_y = gui_h / 2 - 90;

draw_set_font(fnt_button);
draw_set_alpha(0.55);
draw_set_valign(fa_middle);

// LEFT (Largest / Fastest)
draw_set_halign(fa_left);
draw_text(40, mid_y, string_upper(left_label));

// RIGHT (Smallest / Slowest)
draw_set_halign(fa_right);
draw_text(gui_w - 40, mid_y, string_upper(right_label));

// -------------------------------------------------
// RESET DRAW STATE
// -------------------------------------------------
draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
