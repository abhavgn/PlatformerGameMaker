if (hint_alpha > 0) {
    draw_set_alpha(hint_alpha);
    
    var _gx = display_get_gui_width() / 2;
    var _gy = display_get_gui_height() - 100;
    
    // Draw a semi-transparent backing box
    draw_set_color(c_black);
    draw_rectangle(_gx - 200, _gy - 30, _gx + 200, _gy + 30, false);
    
    // Draw a yellow border to make it look like an alert
    draw_set_color(c_yellow);
    draw_rectangle(_gx - 200, _gy - 30, _gx + 200, _gy + 30, true);
    
    // The Hint Text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(-1); // Use small default font
    draw_text(_gx, _gy, "ADVICE: HOLD SHIFT TO SPRINT");
    
    draw_set_alpha(1); // Always reset alpha!
}