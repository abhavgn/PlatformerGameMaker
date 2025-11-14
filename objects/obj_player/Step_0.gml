// Horizontal input
hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;

// Apply gravity
vsp += grv;

// Jumping
if (keyboard_check_pressed(vk_space) && on_ground) {
    vsp = jmp;
}

// Horizontal collision
if (place_meeting(x + hsp, y, obj_platform)) {
    while (!place_meeting(x + sign(hsp), y, obj_platform)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical collision
if (place_meeting(x, y + vsp, obj_platform)) {
    while (!place_meeting(x, y + sign(vsp), obj_platform)) {
        y += sign(vsp);
    }
    vsp = 0;
    on_ground = true;
} else {
    on_ground = false;
}
y += vsp;





// --- GML Code for Step Event (Checking for a Fall) ---

// 1. Define the Death Zone Y-Coordinate
// Set to 2200, which is below your room height of 2160.
var _death_y = 2200;

// 2. Define the Respawn Coordinates (The Start Point in the level)
// You need to confirm the desired X/Y coordinates for the start of rm_play1.
// Using the placeholder 100, 100 from our previous example.
var _respawn_x = 128;
var _respawn_y = 1888;

// 3. Check if the player has fallen below the Death Zone
if (y > _death_y)
{
    // A. Move the Player to the Respawn Point
    x = _respawn_x;
    y = _respawn_y;

    // B. Stop all Movement
    // Use the speed variables you use for player movement (hspeed/vspeed or hsp/vsp).
    hspeed = 0;
    vspeed = 0;
}