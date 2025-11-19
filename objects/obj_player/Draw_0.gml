// --- 1. Draw the Player (With Flashing Logic) ---
image_alpha = flash_alpha;
draw_self();
image_alpha = 1;


// --- 2. Draw Active Shield (The Sprite Overlay) ---
// Check if Alarm 3 (Shield Timer) is active
if (alarm[3] > 0) 
{
    // Draw the shield sprite centered on the player
    // The logical coordinates (x,y) are the player's center
    
    // OPTIONAL: If the shield image is too big/small, change the 1, 1 numbers below.
    // Example: Use 0.5, 0.5 to make it half size.
    draw_sprite_ext(spr_shield_active, 0, x, y, 1, 1, 0, c_white, 1);
}


// --- 3. Draw Inventory Icons (The HUD above head) ---
if (has_shield == true) {
    draw_sprite_ext(spr_powerup_shield, 0, x, y - 50, 0.5, 0.5, 0, c_white, 0.8);
}
if (has_super_jump == true) {
    draw_sprite_ext(spr_powerup_jump, 0, x - 25, y - 50, 0.5, 0.5, 0, c_white, 0.8);
}
if (has_speed_boost == true) {
    draw_sprite_ext(spr_powerup_speed, 0, x + 25, y - 50, 0.5, 0.5, 0, c_white, 0.8);
}

// --- Stamina Bar Drawing ---

// Bar Dimensions
var _bar_width = 64;  // Width of the bar (adjust to fit your player)
var _bar_height = 8;  // Height of the bar
var _bar_y = y - 70;  // Position it above the player's head

// Calculate the percentage fill
var _stamina_percent = current_stamina / max_stamina;
var _fill_width = _bar_width * _stamina_percent;

// --- Background Bar (Empty State) ---
draw_set_color(c_black);
draw_rectangle(x - _bar_width/2, _bar_y, x + _bar_width/2, _bar_y + _bar_height, false);

// --- Foreground Bar (Current Stamina) ---
// Change color based on Powerup state
if (is_powerup_speed_active) 
{
    // Powerup is ON: Solid Green/Lime (Always full)
    draw_set_color(c_lime); 
    _fill_width = _bar_width; // Force full width during powerup
}
else 
{
    // Normal State: Red/Yellow/Green based on level
    if (_stamina_percent > 0.5) draw_set_color(c_green);
    else if (_stamina_percent > 0.25) draw_set_color(c_yellow);
    else draw_set_color(c_red);
}

// Draw the fill
draw_rectangle(x - _bar_width/2, _bar_y, (x - _bar_width/2) + _fill_width, _bar_y + _bar_height, false);

// Reset draw settings
draw_set_color(c_white);