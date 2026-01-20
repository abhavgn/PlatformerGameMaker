// 1. THE FLICKER (From previous step)
image_alpha = random_range(0.8, 1.0);

// 2. THE OFF-SCREEN DESTROY (Very important so your game doesn't lag!)
if (x < -200 || x > room_width + 200 || y < -200 || y > room_height + 200) {
    instance_destroy();
}

// 3. THE FADING TRAIL CODE (Add this now)
// This creates a "spark" every few frames
if (irandom(10) > 7) { 
    // Create a simple effect or a tiny object
    var _trail = instance_create_layer(x, y, "Instances", obj_comet_spark);
    _trail.speed = 2;
    _trail.direction = direction + 180 + random_range(-10, 10); // Shoots out the back
}