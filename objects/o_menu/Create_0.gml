menu_x = room_width / 2;
menu_y = room_height / 2;
button_h = 48;

button[0] = "Play Now";
button[1] = "How To Play";
buttons = array_length_1d(button);

menu_index = -1;
last_selected = -1;

// NEW: Instructions state
show_instructions = false;
