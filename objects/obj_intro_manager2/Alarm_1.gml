// Spawn a UFO at a random height on the left
instance_create_layer(-100, random(room_height), "Instances", obj_ufo);

// Reset alarm for a random time between 10 and 20 seconds
alarm[1] = irandom_range(600, 1200);