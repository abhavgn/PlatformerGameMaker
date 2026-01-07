// Boundary logic for bouncing off walls
var _room_w = 1920;
var _room_h = 1080;
var _margin_h = (sprite_width * image_xscale) / 2;
var _margin_v = (sprite_height * image_yscale) / 2;

if (x < _margin_h || x > _room_w - _margin_h) {
    hspeed = -hspeed;
    x = clamp(x, _margin_h, _room_w - _margin_h);
}

if (y < _margin_v || y > _room_h - _margin_v) {
    vspeed = -vspeed;
    y = clamp(y, _margin_v, _room_h - _margin_v);
}