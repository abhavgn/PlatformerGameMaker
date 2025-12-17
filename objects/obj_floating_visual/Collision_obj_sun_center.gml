// 1. Run the bounce math
scr_elastic_collision(self, other);

// 2. STABILIZE THE SUN: Reset any tiny speed the script gave it
other.hspeed = 0; 
other.vspeed = 0;
other.y = 540; // Lock it to your center line so it never "teleports" up or down