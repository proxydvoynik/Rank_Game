
global.timer = 0;
global.time_limit = 300;
global.total_score = 0;        
global.topics_done = [false, false, false];
global.current_topic_index = -1;
global.topic_order = [
    [0, 1, 2, 3], // Planets: largest → smallest
    [0, 1, 2, 3], // Animals: fastest → slowest
    [0, 1, 2, 3]  // Technology: fastest → slowest
];


show_debug_message("Controller started");
global.timer_running = false;
global.final_time_taken = 0;
global.final_time_bonus = 0;
// audio settings
global.sound_on = true;

audio_master_gain(1);

// FORCE play bgm
audio_play_sound(snd_bgm, 0, true);

global.topic_names = [
    "Networks",
    "Energy Loss",
    "Algorithms"
];

// elements per topic
global.topic_elements = [
    ["Ethernet", "Wi-Fi", "4G", "Satellite"],
    ["Car Braking", "Sliding Book", "Rolling Ball", "Satellite Orbit"],
    ["Binary Search", "Merge Sort", "Linear Search", "Bubble Sort"]
];


global.topic_questions = [
    "Rank these connections by latency (lowest to highest).",
    "Rank these by energy lost to friction (most to least).",
    "Rank these algorithms by time complexity (fastest to slowest)."
];


global.topic_extremes = [
    ["Lowest Latency", "Highest Latency"],
    ["Most Loss", "Least Loss"],
    ["Fastest", "Slowest"]
];


