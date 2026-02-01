// 1. Starting Position (Shifted to the LEFT side)
x_side = room_width * 0.25; 
x = x_side;
y_start = room_height + 150; 
y = y_start; 

// 2. Target Position (Stopping point in the upper-left)
y_target = 550; // Change this value to where you want it to "park"

// 3. Lerp Variables (Exactly like your original)
t = 0; 
lerp_speed = 0.005; 

// Ensure it stays in front
depth = -15000;