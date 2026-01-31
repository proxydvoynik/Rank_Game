draw_self();

if (global.topics_done[index]) {
    draw_set_alpha(0.5);
    draw_set_color(c_gray);
    draw_text(x + 10, y + 10, "DONE");
} else {
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_text(x + 10, y + 10, "Topic " + string(index + 1));
}

// reset draw state
draw_set_alpha(1);
draw_set_color(c_white);
