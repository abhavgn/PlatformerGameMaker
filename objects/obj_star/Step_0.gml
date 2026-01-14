if (is_vertical == true) {
    // --- VERTICAL MOVEMENT (Top to Bottom) ---
    y += star_speed;

    // Wrap around bottom to top
    if (y > room_height + 32) {
        y = -32;
        x = random(room_width);
    }
} 
else {
    // --- HORIZONTAL MOVEMENT (Right to Left) ---
    x -= star_speed;

    // Wrap around left to right
    if (x < -32) {
        x = room_width + 32;
        y = random(room_height);
    }
}

// --- TWINKLE (Stays the same for both) ---
image_alpha = 0.8 + 0.2 * sin((current_time / 1000) + twinkle_offset);