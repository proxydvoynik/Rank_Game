var center_x = room_width / 2;

// --------------------
// TITLE
// --------------------
draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

draw_text(center_x, 80, "RESULTS");

// --------------------
// STATS
// --------------------
draw_set_font(fnt_button);

draw_text(center_x, 160, "Total Score: " + string(global.total_score));
draw_text(center_x, 210, "Time Taken: " + string(global.final_time_taken) + " sec");
draw_text(center_x, 260, "Time Bonus: " + string(global.final_time_bonus));

// --------------------
// RESET DRAW STATE
// --------------------
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
