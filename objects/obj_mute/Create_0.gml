// ensure sound state exists
if (!variable_global_exists("sound_on")) {
    global.sound_on = true;
}

// set correct sprite at start
if (global.sound_on) {
    sprite_index = spr_sound_on;
} else {
    sprite_index = spr_sound_off;
}
