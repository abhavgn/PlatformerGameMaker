// --- Pickup Shield Logic ---

// 1. Store the item
has_shield = true;

// 2. (Optional) Play a sound effect here like 'snd_pickup'

// 3. Destroy the object from the room
with (other)
{
    instance_destroy();
}