game_state = "story"; // Starts with the story text

// The full story message
message = "EMERGENCY! ALIEN FLEET DETECTED IN SECTOR 7.\nI MUST REACH THE JUMP-SHIP TO WARN EARTH\nBEFORE THE SIGNAL IS JAMMED!";

display_text = "";      // What is actually drawn on screen
char_index = 0;         // How many letters we've typed
type_speed = 0.5;       // Speed of the typewriter (higher = faster)

// Start a timer to move to the next room after the story is done
alarm[0] = -1;

show_prompt = false;
prompt_delay = 60; // Wait 60 frames (1 second) after text is done