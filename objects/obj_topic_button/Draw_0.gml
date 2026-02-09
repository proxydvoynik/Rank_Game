draw_self();

draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// calculate size
var bw = bbox_right - bbox_left;
var bh = bbox_bottom - bbox_top;

if (global.topics_done[index]) {
    draw_set_alpha(0.5);
    draw_set_color(c_gray);
    draw_text(
        x + bw / 2,
        y + bh / 2,
        "DONE"
    );
} else {
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_text(
        x + bw / 2,
        y + bh / 2,
        global.topic_names[index]
    );
}

// reset draw state
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
