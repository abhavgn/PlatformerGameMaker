// --- 1. STAMINA AND SPRINT LOGIC ---

var _is_moving_horizontally = keyboard_check(vk_right) || keyboard_check(vk_left);
var _is_sprinting = false;
var _current_speed_for_hsp = move_speed; // Base speed (4 normally, 8 during powerup)

// Define the threshold needed to start sprinting again
var _min_sprint_stamina = 10; 

// A. Check if Speed Powerup is Active
if (is_powerup_speed_active) 
{
    // Stamina stays full, and speed is locked to 8
    current_stamina = max_stamina;
}
// B. Check for Normal Sprint (Shift Key)
else if (keyboard_check(vk_shift) && current_stamina >= 0 && _is_moving_horizontally)
{
    // If stamina is above the recovery threshold OR if the player is currently sprinting (just started draining), allow sprint.
    if (current_stamina >= _min_sprint_stamina || _is_sprinting) 
    {
        _current_speed_for_hsp = 6; // Set Sprint Speed
        current_stamina -= stamina_drain_rate;
        _is_sprinting = true;
    }
}
// C. Stamina Recharge (If not sprinting, not Powerup active)
else if (!_is_sprinting && current_stamina < max_stamina)
{
    current_stamina += stamina_recharge_rate;
}

// D. Clamp Stamina (Ensure it never goes below zero)
current_stamina = clamp(current_stamina, 0, max_stamina);


// --- 2. MOVEMENT AND PHYSICS ---

// LADDER DETECTION ADDED HERE
var _on_ladder = place_meeting(x, y, obj_ladder);

// Start climbing if touching ladder and pressing up or down
if (_on_ladder && (keyboard_check(vk_up) || keyboard_check(vk_down))) {
    is_climbing = true;
}

// Stop climbing if we leave the ladder or jump
if (!_on_ladder || keyboard_check_pressed(vk_space)) {
    is_climbing = false;
}

// Horizontal input (uses the calculated speed)
hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * _current_speed_for_hsp;

// Apply gravity (ONLY if not climbing)
if (!is_climbing) {
    vsp += grv;
} else {
    // Climbing vertical movement
    vsp = (keyboard_check(vk_down) - keyboard_check(vk_up)) * 4;
    hsp = hsp * 0.5; // Optional: slow down side-to-side movement while on ladder
}

// Jumping
if (keyboard_check_pressed(vk_space) && on_ground) {
    vsp = jmp;
}

// ----------------------------------------------------
// 🔥 SPRITE ASSIGNMENT LOGIC (FIXED IDLE) 🔥
// ----------------------------------------------------

// LADDER SPRITE ADDED HERE
if (is_climbing) 
{
    //sprite_index = spr_climb; // Ensure you have a sprite named spr_climb
    image_speed = (vsp != 0) ? 1 : 0; // Only animate if moving
}
// 1. Vertical State (Jumping or Falling)
else if (!on_ground) 
{
    if (vsp < 0) 
    {
        // Moving up
        sprite_index = up;
    } 
    else 
    {
        // Moving down/falling
        sprite_index = down;
    }
    // Ensure animation speed is running during movement/jumping
    image_speed = 1; 
}
// 2. Horizontal State (Running or Idle)
else 
{
    if (hsp != 0) 
    {
        // Running Left or Right
        sprite_index = (hsp > 0) ? right : left;
        last_hdir = sign(hsp);
        // Ensure animation speed is running during movement
        image_speed = 1; 
    } 
    else 
    {
        // Idle
        sprite_index = demo;
        
        // FIX: Stop the animation when idle
        image_speed = 0;
        image_index = 1; // Lock it to the first frame
    }
}

// ----------------------------------------------------

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


// --- 3. FALL DETECTION / RESPAWN ---

// Room Height is 2160, so Death Zone Y is 2200.
var _death_y = 2200;

// Check if the player has fallen below the Death Zone
if (y > _death_y)
{
    // A. Move the Player to the Respawn Point (using global checkpoint)
    x = global.respawn_x;
    y = global.respawn_y;

    // B. Stop all Movement
    hspeed = 0;
    vspeed = 0;

    // C. Apply Mercy Invincibility
    invincible = true;
    alarm[0] = 120; 
}


// --- 4. INVINCIBILITY FLASH CALCULATION ---

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


// --- 5. POWERUP ACTIVATION (X, C, Z Keys) ---

// --- Activate Shield (Press "Z") ---
if (keyboard_check_pressed(ord("Z"))) 
{
    if (has_shield == true)
    {
        has_shield = false;
        
        // Activate Invincibility and Visuals
        invincible = true;
        //image_blend = c_aqua;
        
        // Set Timer for 10 Seconds (600 steps)
        alarm[3] = 600; 
    }
}

// --- Activate Super Jump (Press "X") ---
if (keyboard_check_pressed(ord("X"))) 
{
    if (has_super_jump == true)
    {
        has_super_jump = false; 
        
        jmp = -20;    // 1. Apply effect
        alarm[1] = 300;         // 2. Set timer (5 sec)
        //image_blend = c_lime;   // 3. Visual feedback
    }
}

// --- Activate Speed Boost (Press "C") ---
if (keyboard_check_pressed(ord("C"))) 
{
    if (has_speed_boost == true)
    {
        has_speed_boost = false; 
        
        move_speed = 8;                 // 1. Apply maximum speed
        is_powerup_speed_active = true; // 2. Flag disables stamina drain/recharge
        current_stamina = max_stamina;  // 3. Stamina instantly fills
        alarm[2] = 300;                 // 4. Set timer (5 sec)
        
        //image_blend = c_orange;         // 5. Visual feedback
    }
}