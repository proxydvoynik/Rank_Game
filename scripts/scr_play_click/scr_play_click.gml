function scr_play_click() {
    if (global.sound_on) {
        audio_play_sound(snd_click, 0, false);
    }
}
