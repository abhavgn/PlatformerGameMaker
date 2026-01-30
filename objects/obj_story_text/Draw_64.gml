// 1. Draw the black background
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// 2. Set up the text style
draw_set_font(fnt_story); 
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() / 2;

// Since your font is 48, we use a scale of 1
var _scale = 1;   
var _spacing = 54;  // Slightly larger than the font size so lines don't touch
var _width = 900;   // Give it plenty of room to breathe

draw_text_ext_transformed(_x, _y, display_text, _spacing, _width, _scale, _scale, 0);

// 3. The "Press Space" prompt
if (show_prompt) {
    // Fade the prompt in slowly using alpha
    // This makes it "pulse" softly
    var _alpha = (sin(current_time / 400) * 0.5 + 0.5); 
    draw_set_alpha(_alpha);
    
    draw_text_transformed(_x, display_get_gui_height() - 100, "PRESS SPACE TO START MISSION", 0.6, 0.6, 0);
    
    draw_set_alpha(1); // Reset alpha so it doesn't mess up other things
}