// Movement variables
hsp = 0;           // Horizontal speed
vsp = 0;           // Vertical speed
grv = 0.5;         // Gravity
jmp = -10;         // Jump strength
move_speed = 4;    // Horizontal movement speed

sprint_hint_timer = 0;
sprint_hint_threshold = 60 * 10; // 10 seconds of gameplay
show_sprint_hint = false;
hint_alpha = 0; // For a smooth fade-in effect

// Initialize the global respawn coordinates so the game knows where to send you
global.respawn_x = x; 
global.respawn_y = y;

is_sprinting = false;

// --- Ladder Variables ---
is_climbing = false;
climb_speed = 3;

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