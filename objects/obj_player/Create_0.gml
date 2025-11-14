// Movement variables
hsp = 0;           // Horizontal speed
vsp = 0;           // Vertical speed
grv = 0.5;         // Gravity
jmp = -10;         // Jump strength
move_speed = 4;    // Horizontal movement speed

// Collision flags
on_ground = false;

// --- Variables for Damage/Invincibility ---
invincible = false; // Is the player currently immune to damage?
flash_alpha = 1;   // The current alpha (opacity) for the sprite flash effect