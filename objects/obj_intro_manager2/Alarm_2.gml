// Spawn a small asteroid from any side
var _side = irandom(3);
var _spawn_x, _spawn_y;

if (_side == 0) { _spawn_x = random(room_width); _spawn_y = -50; } // Top
else if (_side == 1) { _spawn_x = room_width + 50; _spawn_y = random(room_height); } // Right
else if (_side == 2) { _spawn_x = random(room_width); _spawn_y = room_height + 50; } // Bottom
else { _spawn_x = -50; _spawn_y = random(room_height); } // Left

instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_asteroid);

// Spawn a new asteroid every 3 to 5 seconds
alarm[2] = irandom_range(180, 300);