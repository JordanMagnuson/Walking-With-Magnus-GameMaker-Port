if(instance_exists(oPlayer)){
	if(oPlayer.walking && started == false){
		started = true;
		fadeIn();
		//alpha = 1;
		alarm[0] = 2 * room_speed;
	}
}

if(fadein == true){
	alpha += (1/FADE_IN_DURATION)/room_speed;
}

if(alpha >=1){
	fadein = false;
}

if(fadeout == true){
	if(alpha == 0)
		destroy();
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}