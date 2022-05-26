if(instance_exists(oPlayer)){
	if(started == false){
		started = true;
		alarm[1] = 2 * room_speed
		//alpha = 1;
		
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