// 1. Movement
y = lerp(y, target_y, 0.02);

// 2. Animation Trigger
// We check if the Title has "arrived" (within 1 pixel of the target)
if (abs(y - target_y) < 1) 
{
    // Start the animation speed (adjust 0.1 for faster/slower scrolling)
    image_speed = 0.1; 
    
    // 3. Loop Control (Skip frame 0)
    // If the animation hits the end or loops back to 0, force it to frame 1
    if (image_index >= image_number || image_index < 1) 
    {
        image_index = 1;
    }
}