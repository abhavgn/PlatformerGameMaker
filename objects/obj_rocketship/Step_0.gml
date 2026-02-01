// 1. Increase progress
t += lerp_speed;

// 2. Clamp 't' so it stops perfectly at the target
t = min(t, 1);

// 3. Apply the Lerp 
y = lerp(y_start, y_target, t);

// Apply the wobble around our new left-side position
x = x_side + (sin(current_time / 200) * 5);

