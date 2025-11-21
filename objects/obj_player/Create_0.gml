// Movement variables
hsp = 0;           // Horizontal speed
vsp = 0;           // Vertical speed
grv = 0.5;         // Gravity
jmp = -10;         // Jump strength
move_speed = 4;    // Horizontal movement speed

last_hdir = 1; // 1 = Right, -1 = Left. (Assumes character starts facing right)

// Collision flags
on_ground = false;

// --- Variables for Damage/Invincibility ---
invincible = false; // Is the player currently immune to damage?
flash_alpha = 1;   // The current alpha (opacity) for the sprite flash effect

// --- Inventory / Stored Powerups ---
has_shield = false;       // Do we have a shield stored?
has_super_jump = false;   // Do we have a jump boost stored?
has_speed_boost = false;  // Do we have a speed boost stored?

// --- Stamina System Variables (UPDATED LENGTH) ---
max_stamina = 100;     // Increased capacity for longer duration
current_stamina = 100; // Start full
stamina_drain_rate = 0.65; // Significantly reduced drain rate (from 1.5)
stamina_recharge_rate = 0.45; // Slightly reduced recharge rate (from 1)

// --- Powerup Integration Variable ---
is_powerup_speed_active = false; // Flag to check if the Speed Powerup is running

// --- Checkpoint/Respawn Setup (New) ---
global.respawn_x = 128;  // Default starting X position
global.respawn_y = 1888; // Default starting Y position