// 1. Draw Black Background
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;
draw_set_color(c_white);

// 2. STATE: STORY
if (game_state == "story") {
    draw_set_font(fnt_story); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Draw the typewriter text
    draw_text_ext_transformed(_cx, _cy, display_text, 54, 900, 1, 1, 0);
} 

// 3. STATE: INSTRUCTIONS
else if (game_state == "instructions") {
    // Draw the image you just generated!
    // We center it by subtracting half its width/height (assuming origin is top-left)
    var _spr_w = sprite_get_width(spr_instructions);
    var _spr_h = sprite_get_height(spr_instructions);
    
    // Draw sprite scaled slightly if needed (here set to 1)
    draw_sprite(spr_instructions, 0, _cx - (_spr_w/2), _cy - (_spr_h/2));
}

// 4. THE "PACING" PROMPT (Pulsing Text)
if (show_prompt) {
    // This math creates a smooth "breathing" effect for the transparency
    var _alpha = sin(current_time / 400) * 0.5 + 0.5; 
    draw_set_alpha(_alpha);
    
    draw_set_font(fnt_story); // Or your main font
    draw_set_halign(fa_center);
    
    if (game_state == "story") {
        draw_text_transformed(_cx, display_get_gui_height() - 80, "PRESS SPACE TO CONTINUE", 0.6, 0.6, 0);
    } else {
        draw_text_transformed(_cx, display_get_gui_height() - 80, "PRESS SPACE TO DEPLOY", 0.8, 0.8, 0);
    }
    
    draw_set_alpha(1); // Reset alpha
}