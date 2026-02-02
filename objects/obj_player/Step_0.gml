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

// 1. Calculate base speed from keys
hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * _current_speed_for_hsp;

// 2. PRECISE Point Check (Checks 1 pixel below the player's center)
// This prevents the "early hit" at the edges.
var _conveyor = instance_position(x, bbox_bottom + 1, obj_platform_conveyor);

if (_conveyor != noone) {
    var _push_force = -2; // Smooth airport speed
    
    if (hsp == 0) {
        hsp = _push_force; // Slide while idle
    } else {
        hsp += _push_force; // Resist while running
    }
}

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
// 🔥 SPRITE ASSIGNMENT LOGIC (ADJUSTED ANIMATION SPEED) 🔥
// ----------------------------------------------------

// ----------------------------------------------------
// 🔥 CLIMBING LOGIC (NO SPRITE WORKAROUND) 🔥
// ----------------------------------------------------
if (is_climbing) 
{
    // 1. Use Idle sprite based on the last direction faced
    if (last_hdir == -1) sprite_index = spr_characteridleL;
    else sprite_index = spr_characteridleR;

    // 2. Add a "climbing" wobble
    if (vsp != 0) 
    {
        // This tilts the sprite back and forth slightly as you climb
        image_angle = sin(current_time / 100) * 10; 
        
        // Make the idle arms "vibrate" a little to show effort
        image_speed = 0.5; 
    } 
    else 
    {
        // Stop wobbling when staying still on the ladder
        image_angle = 0;
        image_speed = 0;
        image_index = 0;
    }
}
else 
{
    // Reset the angle when not on a ladder
    image_angle = 0;
    
    // ... (rest of your existing jumping/running/idle logic)
}

// 1. VERTICAL STATE (Jumping or Falling)
if (!on_ground) 
{
    if (last_hdir == -1) sprite_index = spr_characterrunL;
    else sprite_index = spr_characterrunR;
    
    // Slow down the "wind-blown" look while in the air
    image_speed = 0; 
}
// 2. HORIZONTAL STATE (Running or Idle)
else 
{
    if (hsp != 0) 
    {
        // RUNNING: Switch based on current movement
        if (hsp < 0) {
            sprite_index = spr_characterrunL;
            last_hdir = -1;
        } else {
            sprite_index = spr_characterrunR;
            last_hdir = 1;
        }
        
        // ADJUST THIS: 0.2 is nice and steady. 
        // If sprinting (hsp > 4), it bumps to 0.4.
        image_speed = (abs(hsp) > 4) ? 0.6 : 0.4; 
    } 
    else 
    {
        // IDLE: Facing last direction
        if (last_hdir == -1) {
            sprite_index = spr_characteridleL;
        } else {
            sprite_index = spr_characteridleR;
        }
        
        // Stop animation on the idle frame
        image_speed = 0;
        image_index = 0; 
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

// --- UNIFIED DAMAGE & DEATH LOGIC ---

var _take_damage = false;

// A. Check for Baddie Collision
if (place_meeting(x, y, obj_baddie) && !invincible) {
    _take_damage = true;
}

// B. Check for Laser Collision (using your existing laser logic)
// This assumes you check this inside the Player or the Laser object
// if (collision_line_with_laser && !invincible) _take_damage = true;

// C. Check for Fall Damage (Your existing Y threshold)
if (y > 2200) {
    _take_damage = true;
}

// --- EXECUTE DAMAGE ---
if (_take_damage) {
    global.player_lives -= 1;
    
    if (global.player_lives > 0) {
        // Respawn Logic
        x = global.respawn_x;
        y = global.respawn_y;
        hsp = 0;
        vsp = 0;
        
        // Apply Mercy Invincibility
        invincible = true;
        alarm[0] = 120; 
    } else {
        // Game Over Logic
        room_goto(rm_lose); 
    }
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

// If moving but NOT sprinting, increase the timer
if (!keyboard_check(vk_shift)) {
    sprint_hint_timer += 1;
} else if (keyboard_check(vk_shift)) {
    // If they figure it out, reset the timer and hide the hint
    sprint_hint_timer = 0;
    show_sprint_hint = false;
}

// Trigger the hint if they hit the threshold
if (sprint_hint_timer >= sprint_hint_threshold) {
    show_sprint_hint = true;
}

// Smoothly fade the hint alpha in and out
if (show_sprint_hint) {
    hint_alpha = min(hint_alpha + 0.05, 1);
} else {
    hint_alpha = max(hint_alpha - 0.05, 0);
}_hint_done = true;