var padding = 20;

// remaining time
var remaining = max(0, ceil(global.time_limit - global.timer));

// convert to MM:SS
var minutes = floor(remaining / 60);
var seconds = remaining mod 60;

var time_text =
    string(minutes) + ":" +
    string_format(seconds, 2, 0);

// draw top-right
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_text(room_width - padding, padding, "Time: " + time_text);

// reset draw state
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
