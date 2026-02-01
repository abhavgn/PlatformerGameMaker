// 1. STORY STATE: Handle the typewriter effect
if (game_state == "story") {
    if (char_index < string_length(message)) {
        char_index += type_speed;
        display_text = string_copy(message, 1, floor(char_index));
    } else {
        // Text is finished, wait a moment then show prompt
        if (prompt_delay > 0) {
            prompt_delay -= 1;
        } else {
            show_prompt = true;
        }
    }
}

// 2. INSTRUCTIONS STATE: Just wait for the delay
else if (game_state == "instructions") {
    if (prompt_delay > 0) {
        prompt_delay -= 1;
    } else {
        show_prompt = true;
    }
}

// 3. TRANSITIONS: Handle Space Bar Input
if (show_prompt && keyboard_check_pressed(vk_space)) {
    if (game_state == "story") {
        // Switch from Story to Instructions
        game_state = "instructions";
        show_prompt = false; // Reset the prompt
        prompt_delay = 60;   // Wait 1 second before showing "Press Space" again
    } 
    else if (game_state == "instructions") {
        // Switch from Instructions to Gameplay
        room_goto(rm_play1); 
    }
}