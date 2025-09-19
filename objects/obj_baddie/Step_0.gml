/// obj_baddie – Step Event

// Move
x += dir * spd;

// Check for crossing the right boundary
if (x > patrol_right) {
    x   = patrol_right;  // clamp position
    dir = -1;            // reverse
}

// Check for crossing the left boundary
if (x < patrol_left) {
    x   = patrol_left;   // clamp position
    dir = 1;             // reverse
}

// Update sprite facing
image_xscale = (dir > 0) ? 1 : -1;
