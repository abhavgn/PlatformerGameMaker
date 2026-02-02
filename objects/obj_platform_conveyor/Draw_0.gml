// 1. Draw the platform itself (The "Belt")
draw_self(); 

// 2. Set the Arrow Color
draw_set_color(c_yellow); // You can use c_lime or any color

// 3. Define spacing and animation
var _spacing = 64; // How far apart the arrows are
var _scroll_speed = (current_time / 20) % _spacing; // Moves them over time

// 4. Loop from the left edge to the right edge
// We start slightly outside the box to keep the scrolling smooth
for (var i = bbox_left - _spacing; i < bbox_right; i += _spacing) {
    
    var _arrow_x = i + _scroll_speed;
    
    // Only draw the arrow if it's actually inside the platform boundaries
    if (_arrow_x > bbox_left + 8 && _arrow_x < bbox_right - 8) {
        
        // Draw a "V" shape pointing LEFT (<)
        // Adjust "bbox_bottom - 10" to move them up or down
        var _y_pos = bbox_bottom - 12;
        
        draw_line_width(_arrow_x, _y_pos, _arrow_x + 10, _y_pos - 10, 3);
        draw_line_width(_arrow_x, _y_pos, _arrow_x + 10, _y_pos + 10, 3);
    }
}

// 5. Reset color so other things don't turn yellow!
draw_set_color(c_white);