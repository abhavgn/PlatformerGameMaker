function scr_elastic_collision(_obj1, _obj2) 
{
    var obj1 = _obj1;
    var obj2 = _obj2;

    var dist = point_distance(obj1.x, obj1.y, obj2.x, obj2.y);
    if (dist == 0) exit; 

    // 1. Normal Vector (Direction of collision)
    var nx = (obj2.x - obj1.x) / dist;
    var ny = (obj2.y - obj1.y) / dist;

    // 2. Relative Velocity
    var rel_vx = obj1.hspeed - obj2.hspeed;
    var rel_vy = obj1.vspeed - obj2.vspeed;
    var vel_along_normal = dot_product(rel_vx, rel_vy, nx, ny);

    // 3. EXIT if they are already moving apart (prevents sticking)
    if (vel_along_normal >= 0) exit;

    // 4. ANTI-SINKING (Position Correction)
    var r1 = (obj1.sprite_width * obj1.image_xscale) / 2;
    var r2 = (obj2.sprite_width * obj2.image_xscale) / 2;
    var overlap = (r1 + r2) - dist;

    if (overlap > 0) {
        var total_mass = obj1.mass + obj2.mass;
        obj1.x -= nx * overlap * (obj2.mass / total_mass);
        obj1.y -= ny * overlap * (obj2.mass / total_mass);
        obj2.x += nx * overlap * (obj1.mass / total_mass);
        obj2.y += ny * overlap * (obj1.mass / total_mass);
    }

    // 5. THE BOUNCE
    var j = -(2 * vel_along_normal) / (1/obj1.mass + 1/obj2.mass);
    obj1.hspeed += (j / obj1.mass) * nx;
    obj1.vspeed += (j / obj1.mass) * ny;
    obj2.hspeed -= (j / obj2.mass) * nx;
    obj2.vspeed -= (j / obj2.mass) * ny;
}