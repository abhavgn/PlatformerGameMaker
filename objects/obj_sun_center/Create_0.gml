// Make the GIF animate slowly
image_speed = 0.5;

// Scale the Sun down (e.g., to 75%)
image_xscale = 0.75; 
image_yscale = 0.75; 

// --- PHYSICS SETUP ---
// Mass: Set to a high value so planets barely move it
mass = 200; // Much heavier than the planets (mass=1)

// Initial Movement: Constant, slow drift
hspeed = 0.25; 
vspeed = 0;   // Keep its vertical path stable