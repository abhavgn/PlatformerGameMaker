var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _paper_x = _gw * 0.7; 
var _paper_y = _gh * 0.5;

// 1. Draw the Newspaper first
if (show_paper) {
    draw_sprite_ext(spr_newspaper, 0, _paper_x, _paper_y, paper_scale, paper_scale, paper_rotation, c_white, 1);
}

// 2. Draw the Return Message second
if (show_return_msg) {
    draw_set_halign(fa_center);
    var _pulse = abs(sin(current_time / 600));
    draw_set_alpha(_pulse);
    draw_text(_gw / 2, 80, "PRESS SPACE TO RETURN TO START");
    draw_set_alpha(1);
}

// 3. THE FLASH: This must be at the very bottom so it covers the whole screen
if (flash_alpha > 0) {
    draw_set_alpha(flash_alpha);
    draw_set_color(c_white);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1);
}