// 1. Setup the floating and pulsing math
var _hover = sin(current_time / 500) * 8; 
var _pulse = 1 + (sin(current_time / 300) * 0.1);
var _yy = y + _hover;

// 2. Set the color (Neon Red/Pink)
draw_set_color(c_red);

// 3. Draw the Heart Shape using basic shapes
// Left "Lobe"
draw_circle(x - (8 * _pulse), _yy - (5 * _pulse), 10 * _pulse, false);

// Right "Lobe"
draw_circle(x + (8 * _pulse), _yy - (5 * _pulse), 10 * _pulse, false);

// Bottom Point (Triangle)
draw_primitive_begin(pr_trianglelist);
    draw_vertex(x - (18 * _pulse), _yy);           // Left side
    draw_vertex(x + (18 * _pulse), _yy);           // Right side
    draw_vertex(x, _yy + (20 * _pulse));          // Bottom point
draw_primitive_end();

// 4. Add a little white "shine" for polish
draw_set_color(c_white);
draw_circle(x - (10 * _pulse), _yy - (8 * _pulse), 3 * _pulse, false);

// Reset color to white so other things draw correctly
draw_set_color(c_white);