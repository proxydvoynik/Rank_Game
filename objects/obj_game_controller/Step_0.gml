// Global timer
global.timer += 1/room_speed;

// Auto end if time up
if (global.timer >= global.time_limit) {
    room_goto(rm_results);
}
