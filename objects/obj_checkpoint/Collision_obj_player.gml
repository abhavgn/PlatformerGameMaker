// Check if this checkpoint is ready to be claimed
if (is_active == true)
{
    // 1. Update the global variables to the player's current position
    global.respawn_x = other.x;
    global.respawn_y = other.y;
    
    // 2. Change the sprite to the claimed (green) flag
    sprite_index = spr_checkpoint_claimed;
    
    // 3. Deactivate the checkpoint so it can't be triggered again
    is_active = false;
}