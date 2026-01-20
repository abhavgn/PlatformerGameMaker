v_timer += 0.05;
y += sin(v_timer) * 0.5; // Smooth hovering

// Screen wrap
if (x > room_width + 100) x = -100;