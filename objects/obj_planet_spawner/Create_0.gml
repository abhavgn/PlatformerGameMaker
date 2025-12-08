// List of sprites to cycle through: Earth, Moon, Saturn, Rocket
planet_sprites = [
    spr_earthgif,
    spr_moongif,
    spr_saturngif,
    spr_rocketgif
];

// Index to track which sprite is next
sprite_index_tracker = 0;

// Start the spawning process (e.g., spawn a visual every 4 seconds)
alarm[0] = room_speed * 4; // 4 seconds (adjust as desired)