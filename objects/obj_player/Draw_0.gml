// --- GML Code for Draw Event ---

// 1. Set the custom alpha we calculated in the Step Event
image_alpha = flash_alpha;

// 2. Draw the player sprite using the standard drawing function
draw_self(); 

// 3. Reset the alpha to 1 so other sprites/objects aren't affected
image_alpha = 1;