// Menu buttons (unchanged)
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

// ===== INSTRUCTIONS BOX =====
if (show_instructions) {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Box background
    var box_w = 600;
    var box_h = 400;
    var box_x = (room_width - box_w) / 2;
    var box_y = (room_height - box_h) / 2;
    
    draw_set_color(c_black);
    draw_roundrect(box_x, box_y, box_x + box_w, box_y + box_h, false);
    
    // Box border
    draw_set_color(c_white);
    draw_roundrect(box_x, box_y, box_x + box_w, box_y + box_h, true);
    
    // Title
    draw_set_color(c_yellow);
    draw_set_font(font_main);
    draw_set_halign(fa_center);
    draw_text(box_x + box_w / 2, box_y + 20, "How To Play");
    
    draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	var text_x = box_x + box_w / 2;

	// Calculate total text height for perfect centering
	var lines = 4;
	var line_height = 25;
	var total_text_h = lines * line_height;
	var text_start_y = (box_y + box_h / 2) - (total_text_h / 2);  // center block

	// Draw each line
	draw_text(text_x, text_start_y + 0 * line_height, "1. Read the category (e.g. 'Spiciest Foods')");
	draw_text(text_x, text_start_y + 2 * line_height, "2. Drag items to sort them in order");
	draw_text(text_x, text_start_y + 4 * line_height, "3. Click 'Submit' to see your score");
	draw_text(text_x, text_start_y + 6 * line_height, "4. Check comments to argue about rankings!");

    
    // Close button
    var close_x = box_x + box_w - 60;
    var close_y = box_y + 20;
    var close_w = 40;
    var close_h = 30;
    
    draw_set_color(c_red);
    draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(close_x + close_w / 2, close_y + close_h / 2, "X");
    
    // Close button hitbox (also in Step)
    if (mouse_check_button_pressed(mb_left) && 
        mouse_x >= close_x && mouse_x <= close_x + close_w &&
        mouse_y >= close_y && mouse_y <= close_y + close_h) {
        show_instructions = false;
    }
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
