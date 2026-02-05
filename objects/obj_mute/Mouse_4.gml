global.sound_on = !global.sound_on;

if (global.sound_on) {
    audio_master_gain(1);
    audio_play_sound(snd_click, 0, false); // feedback on unmute
} else {
    audio_master_gain(0);
}
