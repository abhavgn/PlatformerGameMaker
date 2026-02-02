// 1. Get the player
var _p = obj_player;

// 2. Check if the player exists
if (instance_exists(_p)) {
    
    // 3. IS THE PLAYER STANDING ON ME?
    // Check if player's X is between my left and right sides
    if (_p.x > bbox_left && _p.x < bbox_right) {
        
        // Check if player's feet (y) are touching my top (bbox_top)
        // We use a 10-pixel "buffer" to make sure it catches them
        if (_p.y > bbox_top - 10 && _p.y < bbox_top + 5) {
            
            // 4. FORCE MOVE THEM
            with (_p) {
                var _push = -3; // The airport slide speed
                
                // Only move if there isn't a wall in the way
                if (!place_meeting(x + _push, y, obj_platform)) {
                    x += _push;
                }
            }
        }
    }
}