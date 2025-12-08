// 1. Get the next sprite in the list
var _next_sprite = planet_sprites[sprite_index_tracker];

// 2. Determine start side, position, and direction
var _start_x, _hspeed;
var _side = choose("LEFT", "RIGHT"); 

// Choose a random vertical position (Y) within the view
var _start_y = random_range(0, 736); 

if (_side == "RIGHT")
{
    // Start off-screen right, move left
    _start_x = room_width + 100;
    _hspeed = random_range(-2, -1); 
}
else // Spawn from the LEFT
{
    // Start off-screen left, move right
    _start_x = -100;
    _hspeed = random_range(1, 2); 
}

// 3. Create the instance of obj_floating_visual
var _instance = instance_create_layer(_start_x, _start_y, "Instances", obj_floating_visual);
_instance.sprite_index = _next_sprite;
_instance.hspeed = _hspeed;

// ADD THESE TWO LINES TO MAKE THE GIFS HALF SIZE (50%)
_instance.image_xscale = 0.5; // Sets the horizontal scale to 50%
_instance.image_yscale = 0.5; // Sets the vertical scale to 50%

// 4. Update the tracker to the next sprite (cycle back to 0 when done)
sprite_index_tracker++;
if (sprite_index_tracker >= array_length(planet_sprites))
{
    sprite_index_tracker = 0;
}

// 5. Reset the alarm for the next spawn
alarm[0] = room_speed * 4;