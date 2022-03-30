if (global.debug) {
	if(keyboard_check_pressed(ord("C"))){
		changeLocation();
	}
	if(keyboard_check_pressed(ord("N"))){
		advanceTime();
	}
	if(keyboard_check_pressed(ord("1"))){
		changeLocation("beach");
	}
	if(keyboard_check_pressed(ord("2"))){
		changeLocation("desert");
	}if(keyboard_check_pressed(ord("3"))){
		changeLocation("forest");
	}
	if(keyboard_check_pressed(ord("4"))){
		changeLocation("plains");
	}
	if(keyboard_check_pressed(ord("5"))){
		changeLocation("snow");
	}
}

oddFrame *= -1;

if(thirdFrame == 3)
{
	thirdFrame = 1;
}
else
{
	thirdFrame += 1;
}

if(fourthFrame == 4)
{
	fourthFrame = 1;
}
else
{
	fourthFrame += 1;
}
