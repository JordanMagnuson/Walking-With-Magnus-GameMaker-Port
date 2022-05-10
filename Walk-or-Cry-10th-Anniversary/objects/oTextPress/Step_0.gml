if(instance_exists(oPlayer)){
	if(oPlayer.walking && started == false){
		started = true;
		fadein = true;
		//alpha = 1;
		alarm[0] = 3 * room_speed;
	}
}

if(fadein == true)
	alpha += (1/FADE_IN_DURATION)/room_speed;

if(fadeout == true){
	if(alpha == 0)
		destroy();
	alpha -= (2/FADE_OUT_DURATION)/room_speed;
}