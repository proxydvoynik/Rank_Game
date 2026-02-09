if (state == "fade_out") {
    fade_alpha += fade_speed;

    if (fade_alpha >= 1) {
        fade_alpha = 1;

        // SAFETY CHECK: only change room if target is valid
        if (target_room != noone) {
            var next = target_room;   // store locally
            target_room = noone;      // reset immediately
            room_goto(next);
            state = "fade_in";
        }
    }
}
else if (state == "fade_in") {
    fade_alpha -= fade_speed;

    if (fade_alpha <= 0) {
        fade_alpha = 0;
        state = "idle";
    }
}
