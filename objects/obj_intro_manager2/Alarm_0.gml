// Spawn a comet at the top right, flying toward bottom left
instance_create_layer(room_width + 100, random(room_height/2), "Instances", obj_comet);

// Reset alarm for a random time between 5 and 10 seconds
alarm[0] = irandom_range(300, 600);