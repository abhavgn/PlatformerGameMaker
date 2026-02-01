// --- Step Event ---
timer++;
if (timer > 180) show_static = true;

if (show_static && keyboard_check_pressed(vk_space)) {
    room_goto(rm_start); // Or wherever you want them to go
}