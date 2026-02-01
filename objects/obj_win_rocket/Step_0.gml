// Make it move MUCH faster
x += 25; 
y -= 5; // Steeper angle

// Add a slight "Camera Shake" as it passes
if (x > room_width/4 && x < room_width*0.75) {
    camera_set_view_pos(view_camera[0], random_range(-5, 5), random_range(-5, 5));
} else {
    camera_set_view_pos(view_camera[0], 0, 0);
}