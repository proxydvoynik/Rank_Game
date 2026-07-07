# Rank Game

**Rank Game** is a daily ranking puzzle game built for **[The Reddit Daily Games Hackathon (2026)](https://redditdailygames2026.devpost.com/)** hosted by Reddit and GameMaker.

Designed to live as an interactive Reddit post via **Devvit Web**, the game challenges players with quick, daily technical and educational ranking puzzles. By sorting items correctly and competing for high scores and speed bonuses, players can share their results, sparking friendly debates and engagement in Reddit comment sections.

---

## 🏆 Hackathon Focus & Criteria

This project was built to address key evaluation criteria for the hackathon:

1. **Best Use of GameMaker**:
   - Developed using the **GameMaker** engine, leveraging GameMaker's precise bounding-box calculations for custom drag-and-drop and tile-swapping mechanics.
   - Optimized for HTML5 export to run seamlessly within the sandboxed **Devvit Web** iframe on Reddit desktop and mobile.
   - Implements custom room transition handlers (`obj_transition`) and modular state managers (`obj_controller`).

2. **Best Mobile Game Play**:
   - Implements touchscreen-friendly bounding boxes and drag offsets so dragging feels responsive and natural on mobile screens.
   - Leverages an auto-swapping mechanism: dropping an element onto an occupied slot automatically swaps the two elements, minimizing tedious rearrangement steps on smaller screens.
   - Visual hints indicating extremes (e.g. `Fastest` / `Slowest` or `Lowest Latency` / `Highest Latency`) are anchored to the screen edges for clean guidance.

3. **Daily Reddit Engagement**:
   - Features a quick-fire format containing 3 technical categories that players can complete in minutes.
   - Built to generate a shareable summary on the **Results Screen** (Score, Time Taken, Time Bonus) to foster community-wide competition and commentary.

---

## 🎮 Gameplay Mechanics

1. **Topic Selection**: The player is presented with a set of 3 different categories to play.
2. **Drag & Drop Sorting**:
   - Drag items (`obj_element`) and place them into the designated ranking slots (`obj_slot`).
   - If an item is dropped onto an already occupied slot, the two items **swap** positions.
   - If dropped outside a slot, the item smoothly lerps back to its starting area (staging).
   - Dynamic hover effects highlight slots in **blue** when a dragged item is hovering over them.
3. **Timed Challenge**: A global countdown timer (5 minutes / 300 seconds) is visible at the top-right. The game ends automatically if the timer runs out.
4. **Scoring**:
   - Each correct item in its matching slot adds **25 points**.
   - Maximum of **100 points** per topic (300 points total for the 3 topics).
   - Upon completing all topics, a **time bonus** is awarded based on the remaining time: `floor((time_limit - timer) * 0.2)`.
5. **Mute Control**: A persistent audio button lets players mute/unmute the master volume. Toggling state carries across all rooms.
6. **Smooth Transitions**: Fade-out and fade-in transitions smooth the navigation between rooms.

---

## 📚 Topics & Correct Rankings

The game features three technical subjects, each requiring players to sort items from left (index 0 / first extreme) to right (index 3 / second extreme):

### 1. Networks
* **Question**: *Rank these connections by latency (lowest to highest).*
* **Extremes**: `Lowest Latency` (Left) ➔ `Highest Latency` (Right)
* **Correct Order**:
  1. **Ethernet** (Index 0)
  2. **Wi-Fi** (Index 1)
  3. **4G** (Index 2)
  4. **Satellite** (Index 3)

### 2. Energy Loss
* **Question**: *Rank these by energy lost to friction (most to least).*
* **Extremes**: `Most Loss` (Left) ➔ `Least Loss` (Right)
* **Correct Order**:
  1. **Car Braking** (Index 0)
  2. **Sliding Book** (Index 1)
  3. **Rolling Ball** (Index 2)
  4. **Satellite Orbit** (Index 3)

### 3. Algorithms
* **Question**: *Rank these algorithms by time complexity (fastest to slowest).*
* **Extremes**: `Fastest` (Left) ➔ `Slowest` (Right)
* **Correct Order**:
  1. **Binary Search** (Index 0 - $O(\log n)$)
  2. **Merge Sort** (Index 1 - $O(n \log n)$)
  3. **Linear Search** (Index 2 - $O(n)$)
  4. **Bubble Sort** (Index 3 - $O(n^2)$)

---

## 📂 Project Structure

### 🚪 Rooms
* **`rm_start`**: The home screen, featuring the title, play button, how-to-play button, and background music setup.
* **`rm_how_to_play`**: Instructions display panel showing standard gameplay rules.
* **`rm_topic_select`**: Menu to select from the 3 topics. Already completed topics are grayed out and disabled.
* **`rm_game`**: The gameplay arena where elements are instantiated, shuffled, and dragged onto slots.
* **`rm_results`**: Final scoreboard displaying total score, time taken, and calculated time bonus.

### ⚙️ Core Objects
* **`obj_controller`**: Creates and stores global states (timer limits, topic questions, item list arrays, and audio configuration).
* **`obj_game_controller`**: Keeps track of active lists, persisting across standard rooms.
* **`obj_element`**: The draggable tiles containing item labels and correct placement indexes. Snaps to slots, handles drags/swaps, and lerps back to staging if unplaced.
* **`obj_slot`**: Target locations for elements, drawing border outlines and highlighting blue when hovered.
* **`obj_button`**: General button handling click validation and room routing depending on its assigned action (`play`, `how_to_play`, `back_start`, `submit`, `play_again`).
* **`obj_topic_button`**: Buttons on the topic selection room showing topic status (Grayed-out `DONE` vs Name).
* **`obj_transition`**: Fades screen to black and transitions rooms smoothly.
* **`obj_mute`**: Mute button toggling global master gain.
* **`obj_timer_ui` / `obj_game_ui` / `obj_howto_ui` / `obj_results_text`**: Special UI-drawing scripts to draw guidelines, timer, limits, scores, and text.

---

## 🛠️ Global Game State (GML Variables)

* `global.timer`: Accumulates elapsed game time.
* `global.time_limit`: Game timer duration (defaults to `300`).
* `global.timer_running`: Boolean controlling whether the timer is ticking.
* `global.total_score`: Tracks the player's overall score across topics.
* `global.topics_done`: Array of booleans (`[false, false, false]`) to keep track of completed topics.
* `global.current_topic_index`: Selected topic index (`0` for Networks, `1` for Energy Loss, `2` for Algorithms).
* `global.sound_on`: Persistent boolean for toggling master audio.

---

## 🎧 Audio Assets

* **`snd_bgm`**: Background ambient track.
* **`snd_click`**: Sound effect played upon button clicks or correct submits.
* **`snd_menu_switch`**: Sound effect for navigating interface menus.
