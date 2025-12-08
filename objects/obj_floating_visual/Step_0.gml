// --- NEW MOVEMENT ---
x += hspeed;
y += vspeed;

// Check if the instance has moved far outside the screen view (1920 wide)
var _room_width = 1920; 
var _cleanup_offset = 100;

if (hspeed > 0 && x > _room_width + _cleanup_offset) 
{
    instance_destroy();
}
else if (hspeed < 0 && x < -_cleanup_offset) 
{
    instance_destroy();
}