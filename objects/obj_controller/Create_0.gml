
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
    "Planets",
    "Animals",
    "Technology"
];

// elements per topic
global.topic_elements = [
    // Topic 0: Planets
    ["Jupiter", "Neptune", "Earth", "Mars"],

    // Topic 1: Animals
    ["Cheetah", "Horse", "Dog", "Elephant"],

    // Topic 2: Technology
    ["NVMe SSD", "SATA SSD", "USB Flash", "HDD"]
];

global.topic_questions = [
    "Rank the planets from largest to smallest.",
    "Rank the animals from fastest to slowest.",
    "Rank the storage types from fastest to slowest."
];

global.topic_extremes = [
    // Topic 0: Planets
    ["Largest", "Smallest"],

    // Topic 1: Animals
    ["Fastest", "Slowest"],

    // Topic 2: Technology
    ["Fastest", "Slowest"]
];

