// Mouse hover detection for menu
menu_index = -1;
var mx = mouse_x;
var my = mouse_y;

var total_height = buttons * button_h;
var start_y = menu_y - total_height * 0.5;
var half_w = 200;
var left = menu_x - half_w;
var right = menu_x + half_w;

for (var i = 0; i < buttons; i++) {
    var yy = start_y + button_h * i;
    var top = yy - button_h * 0.5;
    var bottom = yy + button_h * 0.5;

    if (mx >= left && mx <= right && my >= top && my <= bottom) {
        menu_index = i;
        break;
    }
}

last_selected = menu_index;

// Handle menu button clicks
if (mouse_check_button_pressed(mb_left) && menu_index != -1) {
    switch (menu_index) {
        case 0:  // Play Now
            room_goto(rm_game);
            break;
            
        case 1:  // How To Play - TOGGLE instructions
            show_instructions = !show_instructions;
            break;
    }
}

