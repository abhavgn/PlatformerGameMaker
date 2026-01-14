// 1. Increase progress
t += lerp_speed;

// 2. Clamp 't' so it never goes past 1 (100% complete)
t = min(t, 1);

// 3. Apply the Lerp
// "Set my Y position to somewhere between start and target, based on progress 't'"
y = lerp(y_start, y_target, t);

// Optional: Add a slight wobble for realism
x = (room_width / 2) + (sin(current_time / 200) * 5);

// 4. Destroy when finished (optional)
// If it's way off screen at the top, get rid of it to save memory
if (y < y_target + 50 && t == 1) {
    // instance_destroy(); // Uncomment this if you want it to disappear forever once it passes
}