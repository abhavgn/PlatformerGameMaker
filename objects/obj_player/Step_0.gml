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





// --- Fall Detection Logic (UPDATED) ---

// Room Height is 2160, so Death Zone Y is 2200.
var _death_y = 2200;

// Respawn Coordinates (UPDATED)
var _respawn_x = 128;
var _respawn_y = 1888;

// Check if the player has fallen below the Death Zone
if (y > _death_y)
{
    // A. Move the Player to the Respawn Point
    x = _respawn_x;
    y = _respawn_y;

    // B. Stop all Movement
    hspeed = 0;
    vspeed = 0;

    invincible = true;
    alarm[0] = 120; 
}

// --- Invincibility Flash Calculation Logic ---

if (invincible == true)
{
    // Calculates a smooth pulsing effect
    flash_alpha = 0.5 + 0.5 * sin(current_time / 50); 
}
else
{
    // Ensure the alpha is 1 when not invincible
    flash_alpha = 1;
}

// ... your regular player movement code goes here ...