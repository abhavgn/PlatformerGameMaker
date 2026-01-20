image_angle += rotation_speed;

// Subtle "glint" effect (flicker alpha)
if (random(100) > 98) image_alpha = 0.5; 
else image_alpha = lerp(image_alpha, 1, 0.1);

if (x > room_width + 100) x = -100;