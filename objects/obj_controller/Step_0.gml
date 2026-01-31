// update timer (seconds)
global.timer += delta_time / 1000000;

// time limit reached
if (global.timer >= global.time_limit) {
    global.timer_running = false;

    global.final_time_taken = floor(global.timer);
    global.final_time_bonus = 0;

    room_goto(rm_results);
}

if (global.timer_running) {
    global.timer += delta_time / 1000000;

    if (global.timer >= global.time_limit) {
        global.timer_running = false;
        room_goto(rm_results);
    }
}
