// Slow drift across the screen
x += 0.5;
y += 0.2;
image_angle += rotation_speed;

// Slowly shrink the ship to show it's getting further away
image_xscale -= 0.001;
image_yscale -= 0.001;

// Stop shrinking when it's tiny
if (image_xscale < 0.1) {
    image_xscale = 0.1;
    image_yscale = 0.1;
}