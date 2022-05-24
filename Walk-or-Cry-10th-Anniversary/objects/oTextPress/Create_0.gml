FADE_IN_DURATION = 3
FADE_OUT_DURATION = 3;
started = false;
text = "Walking With Magnus";

fadein = false;
fadeout = false;

draw_set_font(fntFont);

x = 20;
y = 130;
alpha = 0;

function fadeIn(){
	fadein = true;
}

function nextText(){
	instance_create_depth(0, 0, 0, oTextLetGo);
}

function fadeOut(){
	fadeout = true;
}

function destroy(){
	instance_destroy(self);
}