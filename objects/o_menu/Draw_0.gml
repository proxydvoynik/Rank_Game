// Menu buttons
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var total_height = buttons * button_h;
var start_y = menu_y - total_height * 0.5;

for (var i = 0; i < buttons; i++) {
    var yy = start_y + button_h * i;
    
    draw_set_color(c_ltgray);
    if (menu_index == i) draw_set_color(c_red);
    draw_text(menu_x, yy, button[i]);
}

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
