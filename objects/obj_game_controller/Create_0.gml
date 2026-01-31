persistent = true;

// Timer
global.game_time = 0;
global.timer_running = false;

// Score
global.total_score = 0;

// Topics
global.topics = [
    ["Planets", ["Mercury","Venus","Earth","Mars"]],
    ["CPU", ["Fetch","Decode","Execute","Store"]],
    ["Water Cycle", ["Evaporation","Condensation","Rain"]]
];

// Remaining topic indexes
global.remaining_topics = ds_list_create();
for (var i = 0; i < array_length(global.topics); i++) {
    ds_list_add(global.remaining_topics, i);
}
