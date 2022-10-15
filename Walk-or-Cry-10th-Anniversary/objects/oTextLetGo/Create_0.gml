FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;

text = "Alternate left/right arrow keys to walk";
//font is already set
alpha = 0;
x = 20;
y = 153;
fade = false;
fadein = true;
function fadeOut(){
	fade = true;
}
function destroy(){
	alarm[0] = 2 * room_speed;	
}