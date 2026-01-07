// Spawn 8 planets at random positions in the room
repeat(3) {
    var _rx = random_range(100, 1820);
    var _ry = random_range(100, 980);
    instance_create_layer(_rx, _ry, "Instances", obj_parent_planet);
}