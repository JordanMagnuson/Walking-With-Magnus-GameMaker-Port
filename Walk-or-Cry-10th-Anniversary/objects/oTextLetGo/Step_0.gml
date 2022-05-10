if(fadein == true)
	alpha += (1/FADE_IN_DURATION)/room_speed;
	
if(alpha >=1){
	oTextPress.fadeOut();
	fadeOut();
	fadein = false;
	
}

if(fade == true){
	if(alpha == 0)
		destroy();
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}