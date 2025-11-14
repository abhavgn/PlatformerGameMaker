// GML Code for Collision with obj_baddie

// --- 1. Set the Respawn Coordinates ---
// NOTE: Change 100 and 100 to the actual X and Y coordinates 
// of your player's start point within the room rm_play1.
var _respawn_x = 128;
var _respawn_y = 1888;

// --- 2. Move the Player to the Respawn Point ---
x = _respawn_x;
y = _respawn_y;

// --- 3. Stop all Movement ---
// Assuming you use hspeed/vspeed, or custom hsp/vsp variables for movement.
// Use the variable names you use for player movement!
hspeed = 0; // Standard built-in horizontal speed
vspeed = 0; // Standard built-in vertical speed

// If you use custom speed variables (common in platformers), use these instead:
// hsp = 0;
// vsp = 0;