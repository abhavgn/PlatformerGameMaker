// Horizontal input
hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;

// Apply gravity
vsp += grv;

// Jumping
if (keyboard_check_pressed(vk_space) && on_ground) {
    vsp = jmp;
}

// Horizontal collision
if (place_meeting(x + hsp, y, obj_platform)) {
    while (!place_meeting(x + sign(hsp), y, obj_platform)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical collision
if (place_meeting(x, y + vsp, obj_platform)) {
    while (!place_meeting(x, y + sign(vsp), obj_platform)) {
        y += sign(vsp);
    }
    vsp = 0;
    on_ground = true;
} else {
    on_ground = false;
}
y += vsp;