// obj_sun_center Step Event

// 1. Move the Sun using the constant value, NOT hspeed
x += 0.25; 

// 2. Wrap-Around Logic (Ensures smooth, non-bouncing movement)
var _half_width = sprite_width * image_xscale / 2;

if (x > room_width + _half_width) 
{
    x = -_half_width; 
}