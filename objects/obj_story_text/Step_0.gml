// 1. Handle the typewriter effect
if (char_index < string_length(message)) {
    char_index += type_speed;
    display_text = string_copy(message, 1, floor(char_index));
} 
// 2. Once text is done, start the delay timer
else {
    if (prompt_delay > 0) {
        prompt_delay -= 1;
    } else {
        show_prompt = true; // Timer finished, okay to show "Press Space"
    }
}

// 3. Boom—Go to the level if they press Space
if (show_prompt && keyboard_check_pressed(vk_space)) {
    room_goto(rm_play1); 
}