// Hide the menu stuff
instance_deactivate_object(obj_title);
visible = false; // Hides the button itself

// Create the story controller
instance_create_depth(0, 0, -10000, obj_story_text);