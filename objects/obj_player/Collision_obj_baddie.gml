// --- Collision with Enemy ---

// IMPORTANT: Everything must be inside this check!
// If invincible is TRUE (Shield is on), this entire block is SKIPPED.
if (invincible == false)
{
    // 1. Define Respawn Coordinates
    var _respawn_x = 128;
    var _respawn_y = 1888;

    // 2. Move Player (Respawn)
    x = _respawn_x;
    y = _respawn_y;

    // 3. Stop Movement
    hspeed = 0;
    vspeed = 0;
    
    // 4. Apply "Mercy" Invincibility (So you don't die instantly again)
    invincible = true;
    alarm[0] = 120; // 2 seconds of flashing
}

// If we ARE invincible (Shield is on), the code basically does nothing,
// allowing you to walk right through the enemy!