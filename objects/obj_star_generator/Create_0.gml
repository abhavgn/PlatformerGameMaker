// Spawn 150 stars across the whole screen immediately
repeat(150) {
    instance_create_layer(random(room_width), random(room_height), "Instances", obj_star);
}