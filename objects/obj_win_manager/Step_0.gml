timer++;

// 1. Start the newspaper sequence after a delay
if (timer > 120) show_paper = true; 

if (show_paper) {
    if (paper_scale < 1) {
        paper_scale += 0.04;    
        paper_rotation += 15;   // Constant spin speed
        
        // 2. THE SLAM: Only happens once scale hits 1
        if (paper_scale >= 1) {
            paper_scale = 1;
            paper_rotation = 0; 
            flash_alpha = 1;    // TRIGGER THE FLASH
        }
    } else {
        // 3. Wait 2 seconds AFTER the slam to show the exit text
        return_msg_timer++;
        if (return_msg_timer > 120) show_return_msg = true;
    }
}

// 4. Fade the flash out over time
if (flash_alpha > 0) flash_alpha -= 0.05;

// Only allow restart once the message is visible
if (show_return_msg && keyboard_check_pressed(vk_space)) {
    game_restart();
}