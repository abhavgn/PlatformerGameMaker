// 1. Draw a glowing "blur" behind it
gpu_set_blendmode(bm_add); // Makes it glow!
for (var i = 1; i < 6; i++) {
    // This draws the sprite stretched out behind the comet
    draw_sprite_ext(sprite_index, 0, x - (hspeed * i), y - (vspeed * i), 1 - (i*0.1), 1 - (i*0.1), image_angle, c_aqua, 0.5 / i);
}
gpu_set_blendmode(bm_normal); // Reset to normal drawing

// 2. Draw the actual comet on top
draw_self();