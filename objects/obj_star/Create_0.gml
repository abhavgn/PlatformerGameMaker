// --- EXISTING CODE (Size, color, etc.) ---
var _scale = random_range(1, 4); 
image_xscale = _scale;
image_yscale = _scale;
image_blend = choose(c_white, c_white, c_aqua, c_yellow);
twinkle_offset = random(100);

// --- NEW DIRECTION LOGIC ---
// CHANGE "rm_win" TO THE ACTUAL NAME OF YOUR WINNING ROOM
if (room == rm_win) { 
    is_vertical = true;       // Winning room: Top to Bottom
    star_speed = _scale * 3.5; // Slightly faster for falling effect
} else {
    is_vertical = false;      // Intro/Menu: Right to Left
    star_speed = _scale * 0.4; // Slower for drifting effect
}