//X = keyboard_check(vk_space);

if(walking && !audio_is_playing(sndWalking)){
	audio_play_sound(sndWalking, 75, true);
}
else if(!walking && audio_is_playing(sndWalking))
{
	audio_stop_sound(sndWalking)	
}



if(keyboard_check_pressed(ord("A")) && lastPressedKey != ord("A"))
{
	lastPressedKey = ord("A")
	lastPressedAgo = 0;
	FIRST_BUTTON_CHECKER = 1;
}
else if(keyboard_check_pressed(ord("S")) && lastPressedKey != ord("S"))
{
	lastPressedKey = ord("S")
	lastPressedAgo = 0;
	FIRST_BUTTON_CHECKER = 1;
}
else if(keyboard_check_pressed(ord("D")) && lastPressedKey != ord("D"))
{
	lastPressedKey = ord("D")
	lastPressedAgo = 0;
	FIRST_BUTTON_CHECKER = 1;
}
else 
{
	if(FIRST_BUTTON_CHECKER == 0){
		lastPressedAgo = 1;
	}
	else{
		lastPressedAgo += delta_time / 1000000;
	}
	//lastPressedAgo = 1;
}


if (lastPressedAgo == 0) 
{
	walking = true;
	sleeping = false;
	image_speed =  animSpeed
	if(!startedWalking)
	{
		startedWalking = true;	
	}
	
	
}

else if (lastPressedAgo > 0.6)
{
	walking = false;
}


if (walking) 
{
	timeSinceWalking = 0;
	if(image_index >= 3)
	{
		image_index = 0;	
	}
	//image_speed =  animSpeed
}
else 
{
	timeSinceWalking += delta_time / 1000000;
}

if (!walking && worldController.time == "night" && startedWalking)
{
		sleeping = true;				
}

if(sleeping)
{
	image_speed = 0;
	image_index = 4;
}
else if(!walking)
{
	image_speed = 0;
	image_index = 0;
}

if(keyboard_check_released(vk_space))
{
	audio_stop_sound(sndWalking);
}


//if(X == true){
//	walking = true;
//	image_speed = animSpeed;
//}
//else if (!global.debug) {
//	walking = false;
//	image_index = 0;
//	image_speed = 0;
//}
//if(keyboard_check_released(vk_space) && !global.debug){
//	audio_stop_sound(sndWalking);
//	playerDying = instance_create_depth(0, 0, 0, oPlayerDying);
//	playerDying.x = x;
//	playerDying.y = y; 
//	instance_destroy();
//}