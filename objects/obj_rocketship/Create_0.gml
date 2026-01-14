// 1. Starting Position (Horizontal Center, Off-screen Bottom)
x = room_width / 2;
y_start = room_height + 150; // Start 150px below the screen
y = y_start; // Set current y to the start

// 2. Target Position (Off-screen Top)
y_target = 550; // End 550px above the screen

// 3. Lerp Variables
// 't' is our progress variable, going from 0 (start) to 1 (finished)
t = 0; 

// How fast 't' increases per frame.
// 0.005 means it takes about 200 frames (approx 3.5 seconds at 60fps) to cross.
// Make this smaller for a slower flight, larger for faster.
lerp_speed = 0.005; 

// Ensure it appears in front of the stars
depth = -15000;