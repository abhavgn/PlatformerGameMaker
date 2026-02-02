draw_self();

// 1. The Warning Flicker (Left to Right)
if (!is_active) {
    var _warning_threshold = idle_time - 60;
    if (timer > _warning_threshold) {
        var _flicker_speed = (timer - _warning_threshold) * 0.2;
        var _alpha = abs(sin(current_time * _flicker_speed));
        
        draw_set_alpha(_alpha * 0.4);
        draw_set_color(c_red);
        // Drawing horizontally: x to x + laser_range
        draw_line_width(x, y, x + laser_range, y, 2);
        draw_set_alpha(1);
    }
}

// 2. The Deadly Horizontal Beam
if (is_active) {
    var _beam_height = 12 + random_range(-2, 2); // Pulsing thickness
    
    // Outer Glow
    draw_set_color(c_red);
    draw_line_width(x, y, x + laser_range, y, _beam_height);
    
    // Inner Core
    draw_set_color(c_white);
    draw_line_width(x, y, x + laser_range, y, _beam_height / 3);
}