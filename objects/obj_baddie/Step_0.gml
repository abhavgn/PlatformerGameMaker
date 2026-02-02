// 1. Move
x += dir * spd;

// 2. Boundary Logic
if (x > patrol_right) {
    x   = patrol_right;  
    dir = -1;            
}

if (x < patrol_left) {
    x   = patrol_left;   
    dir = 1;             
}

// 3. Sprite Swap Logic
// If moving right (1), use spr_bad. If moving left (-1), use spr_bad2.
if (dir == 1) {
    sprite_index = spr_bad2;
} else {
    sprite_index = spr_bad;
}

// Ensure xscale stays at 1 so we don't accidentally double-flip the art
image_xscale = 1;