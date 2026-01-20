image_alpha -= fade_speed; // It fades out slowly
if (image_alpha <= 0) instance_destroy(); // Then vanishes