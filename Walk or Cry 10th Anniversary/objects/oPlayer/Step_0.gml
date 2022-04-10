X = keyboard_check(vk_space);

if(walking && !audio_is_playing(sndWalking)){
	audio_play_sound(sndWalking, 75, true);
}

if(X == true){
	walking = true;
	image_speed = animSpeed;
}
else if (!global.debug) {
	walking = false;
	image_index = 0;
	image_speed = 0;
}
if(keyboard_check_released(vk_space) && !global.debug){
	audio_stop_sound(sndWalking);
	playerDying = instance_create_depth(0, 0, 0, oPlayerDying);
	playerDying.x = x;
	playerDying.y = y; 
	instance_destroy();
}