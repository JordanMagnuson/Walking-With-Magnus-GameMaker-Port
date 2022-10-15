// Safety check for HTML5, where audio may not always be available.
if (audio_system_is_available() && audio_sound_is_playable(currentSound)) {
	audio_emitter_gain(soundEmitter00, currentGain00);
	audio_play_sound_on(soundEmitter00, currentSound, 1, 100);
}
else {
	alarm[1] = 10;	// If audio system not available, try again in 10 frames.
}