global.timer = 0;
global.time_limit = 300;
global.total_score = 0;        
global.topics_done = [false, false, false];
global.current_topic_index = -1;
global.topic_order = [
    [0,1,2,3],
    [3,1,0,2],
    [2,0,3,1]
];
show_debug_message("Controller started");
global.timer_running = false;
global.final_time_taken = 0;
global.final_time_bonus = 0;
