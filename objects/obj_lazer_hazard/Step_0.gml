timer++;

// Toggle Logic
if (!is_active && timer >= idle_time) {
    is_active = true;
    timer = 0;
} else if (is_active && timer >= active_time) {
    is_active = false;
    timer = 0;
}

// 3. Collision Check (The "Kill" Logic)
if (is_active) {
    if (collision_line(x, y, x + laser_range, y, obj_player, false, false)) {
        with(obj_player) {
            if (!invincible) {
                global.player_lives -= 1;
                if (global.player_lives <= 0) room_goto(rm_lose);
                else {
                    x = global.respawn_x;
                    y = global.respawn_y;
                    invincible = true;
                    alarm[0] = 120;
                }
            }
        }
    }
}