// 1. Toggle the logic
global.music_muted = !global.music_muted;

// 2. Update the visual frame
if (global.music_muted) {
    image_index = 1; // Show muted icon
    audio_pause_all(); // Silence!
} else {
    image_index = 0; // Show playing icon
    audio_resume_all(); // Bring the beat back
}