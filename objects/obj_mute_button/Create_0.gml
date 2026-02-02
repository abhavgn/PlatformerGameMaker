// 1. Stop the sprite from cycling through the frames automatically
image_speed = 0; 

// 2. Set the frame based on the current global state
if (global.music_muted) {
    image_index = 1; // Muted frame
} else {
    image_index = 0; // Playing frame
}