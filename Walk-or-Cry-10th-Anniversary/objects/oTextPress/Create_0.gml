FADE_IN_DURATION = 3
FADE_OUT_DURATION = 5;
started = false;
fade = false;
text = "Walking With Magnus";
draw_set_font(fntFont);

x = 20;
y = 130;
alpha = 1;


function nextText(){
	instance_create_depth(0, 0, 0, oTextLetGo);
}

function fadeOut(){
	fade = true;
}

function destroy(){
	instance_destroy(oTextPress);
}