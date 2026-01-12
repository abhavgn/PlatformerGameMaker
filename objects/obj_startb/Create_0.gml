image_speed = 0;

audio_stop_all();

audio_play_sound(mus_start, 1, 0);

// Start the button off-screen to the right
x = room_width + 400; 

// This is where the button should sit normally (adjust to your liking)
target_x = room_width / 2;

can_move = false;

alarm[0] = 90;