// --- Reset Speed Boost (Alarm 2) ---

// 1. Return speed to normal
move_speed = 4;

// 2. Turn off the powerup flag
is_powerup_speed_active = false;

// 3. Reset color
// ONLY reset color if the Shield is NOT currently active (Alarm 3 is not running)
if (alarm[3] < 0) {
    image_blend = c_white;
}