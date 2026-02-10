// toggle sound
global.sound_on = !global.sound_on;

// apply audio state
if (global.sound_on) {
    audio_master_gain(1);
    sprite_index = spr_sound_on;
    scr_play_click(); // optional feedback
} else {
    audio_master_gain(0);
    sprite_index = spr_sound_off;
}
