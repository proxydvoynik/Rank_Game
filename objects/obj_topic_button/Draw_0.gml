draw_self();

if (is_array(global.topics_done) && global.topics_done[index]) {
    draw_set_alpha(0.5);
    draw_text(x + 10, y + 10, "DONE");
    draw_set_alpha(1);
} else {
    draw_set_color(c_black);
    draw_text(x + 10, y + 10, "Topic " + string(index + 1));
    draw_set_color(c_white);
}
