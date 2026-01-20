// Manually define exactly how many pixels Saturn is
// 450px wide * 1.3 scale = 585px. 
// We want the 'real' radius to be smaller so it touches the wall.
var _manual_h_radius = 210; // Adjust this until the rings touch the side
var _manual_v_radius = 120; // Adjust this until the top touches the top/bottom

// Horizontal
if (x < _manual_h_radius) {
    hspeed = abs(hspeed);
    x = _manual_h_radius;
} else if (x > room_width - _manual_h_radius) {
    hspeed = -abs(hspeed);
    x = room_width - _manual_h_radius;
}

// Vertical
if (y < _manual_v_radius) {
    vspeed = abs(vspeed);
    y = _manual_v_radius;
} else if (y > room_height - _manual_v_radius) {
    vspeed = -abs(vspeed);
    y = room_height - _manual_v_radius;
}