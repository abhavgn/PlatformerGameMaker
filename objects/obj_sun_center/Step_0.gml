// Move the Sun using its velocity
x += hspeed;
y += vspeed;

// Check for screen wrap-around
var _half_width = sprite_width * image_xscale / 2;

if (x > room_width + _half_width) 
{
    x = -_half_width; // Teleport to the far left
}
else if (x < -_half_width)
{
    x = room_width + _half_width; // Teleport to the far right
}