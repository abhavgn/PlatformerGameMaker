// --- Draw GUI Event ---
if (show_static) {
    // 1. Draw "Static" effect (random gray rectangles)
    for (var i = 0; i < 20; i++) {
        draw_set_alpha(random(0.3));
        draw_set_color(c_white);
        var _rx = random(display_get_gui_width());
        var _ry = random(display_get_gui_height());
        draw_rectangle(_rx, _ry, _rx + 100, _ry + 2, false);
    }
    
    // 2. Draw the Emergency Bars (Colored Rectangles)
    draw_set_alpha(0.4);
    var _w = display_get_gui_width() / 7;
    var _colors = [c_white, c_yellow, c_aqua, c_green, c_fuchsia, c_red, c_blue];
    for (var j = 0; j < 7; j++) {
        draw_set_color(_colors[j]);
        draw_rectangle(j * _w, 0, (j + 1) * _w, display_get_gui_height(), false);
    }

    // 3. The Final Headline
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, display_get_gui_height()/2 - 50, display_get_gui_width(), display_get_gui_height()/2 + 50, false);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2, "CONTACT LOST. THE INVASION BEGINS.", 1.5, 1.5, 0);
    
    // Pulsing "Press Space"
    var _a = sin(current_time / 400) * 0.5 + 0.5;
    draw_set_alpha(_a);
    draw_text(display_get_gui_width()/2, display_get_gui_height() - 100, "PRESS SPACE TO TRY AGAIN");
    draw_set_alpha(1);
}