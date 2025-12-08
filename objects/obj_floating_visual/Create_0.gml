// Existing setup
image_speed = 0.5;
image_xscale = 0.5; // Example scale
image_yscale = 0.5; 

// --- NEW PHYSICS VARIABLES ---
// Mass: Standard mass for planets/rockets
mass = 1; 

// Vertical Speed: Set to a slow, random drift
vspeed = random_range(-0.3, 0.3); // Slow vertical drift
// hspeed is set by the Spawner