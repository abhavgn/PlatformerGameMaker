// Pulse the color between white and neon green
var _glow = (sin(current_time / 200) + 1) / 2;
image_blend = merge_color(c_white, c_lime, _glow);
draw_self();