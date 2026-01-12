// Force to the very front
depth = -9999; 

// 1. Make the stars bigger (Adjust these numbers if they are TOO big)
var _scale = random_range(1, 4); 
image_xscale = _scale;
image_yscale = _scale;

// 2. Parallax Speed (Bigger stars move faster)
star_speed = _scale * 0.4; 

// 3. Colors
image_blend = choose(c_white, c_white, c_aqua, c_yellow);

// 4. Randomize starting point for the twinkle so they don't all blink at once
twinkle_offset = random(100);