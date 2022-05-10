/// @description Insert description here
// You can write your code in this editor
RISE_SPEED = 0.1
FADE_OUT_DURATION = 2;

image_alpha = 1;

fading = false;

function zConstruct(X = 0, Y = 0)
{
	x = X;
	y = Y;
}


function fadeOut()
{
	fading = true;
	alarm[0] = room_speed * FADE_OUT_DURATION;
}

fadeOut()