// 1. Movement
x -= star_speed;

// 2. Wrap around screen
if (x < -32) {
    x = room_width + 32;
    y = random(room_height);
}

// 3. 🔥 THE TWINKLE EFFECT 🔥
// This waves the alpha between 0.2 and 1.0
// Increase "500" to make it blink slower, decrease it to blink faster
image_alpha = 0.6 + 0.4 * sin((current_time / 500) + twinkle_offset);