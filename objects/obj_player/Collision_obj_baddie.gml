// --- Collision with Enemy ---

// IMPORTANT: Everything must be inside this check!
// If invincible is TRUE (Shield is on), this entire block is SKIPPED.
if (invincible == false)
{
    // 1. Respawn at the last saved checkpoint
    x = global.respawn_x;
    y = global.respawn_y;
    
    // 2. Stop movement
    hspeed = 0;
    vspeed = 0;

    // 3. Add Mercy Invincibility
    invincible = true;
    alarm[0] = 120; 
    
    // 4. Reset color
    image_blend = c_white;
}

// If we ARE invincible (Shield is on), the code basically does nothing,
// allowing you to walk right through the enemy!