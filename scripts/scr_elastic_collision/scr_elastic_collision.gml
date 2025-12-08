function scr_elastic_collision(){

/// @function scr_elastic_collision(obj1, obj2)
/// @param {object} obj1 The instance running the event (self)
/// @param {object} obj2 The instance it is colliding with (other)

var obj1 = argument0;
var obj2 = argument1;

// Exit if objects are already separating (prevents perpetual collision)
if (dot_product(obj1.hspeed - obj2.hspeed, obj1.vspeed - obj2.vspeed, obj1.x - obj2.x, obj1.y - obj2.y) >= 0) exit;

// 1. Calculate the Normal Vector (vector connecting the centers)
var normal_x = obj2.x - obj1.x;
var normal_y = obj2.y - obj1.y;

// 2. Normalize the Normal Vector
var normal_len = point_distance(0, 0, normal_x, normal_y);
if (normal_len == 0) exit; 
normal_x /= normal_len;
normal_y /= normal_len;

// 3. Separate the objects (to prevent sinking)
// Assumes sprite_width is the diameter; use sprite_width/2 for radius.
var radius1 = obj1.sprite_width * obj1.image_xscale / 2;
var radius2 = obj2.sprite_width * obj2.image_xscale / 2;
var overlap = radius1 + radius2 - normal_len;

obj1.x -= normal_x * overlap / 2;
obj1.y -= normal_y * overlap / 2;
obj2.x += normal_x * overlap / 2;
obj2.y += normal_y * overlap / 2;

// 4. Calculate relative velocity
var rel_vx = obj1.hspeed - obj2.hspeed;
var rel_vy = obj1.vspeed - obj2.vspeed;

// 5. Calculate impulse component along the normal
var impulse_normal = dot_product(rel_vx, rel_vy, normal_x, normal_y);

// 6. Calculate Impulse Scalar (e = 1 for perfectly elastic)
var e = 1; 
var j = -(1 + e) * impulse_normal / (1/obj1.mass + 1/obj2.mass);

// 7. Apply Impulse to find new velocities
obj1.hspeed += j / obj1.mass * normal_x;
obj1.vspeed += j / obj1.mass * normal_y;
obj2.hspeed -= j / obj2.mass * normal_x;
obj2.vspeed -= j / obj2.mass * normal_y;

}