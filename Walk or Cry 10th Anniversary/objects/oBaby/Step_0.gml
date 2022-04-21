x = oPlayer.x + 14;
y = oPlayer.y;

// STATE_AWAKE
// -------------------------------------------------------
if(state == STATE_AWAKE)
{
	if(oMyWorldController.time == "night")
	{
		state = STATE_ASLEEP;
		exit;
	}
	else if(oPlayer.timeSinceWalking > 1)
	{
		state = STATE_CRYING;
		exit;
	}
	
	if(alarm[1] == -1)
	{
		alarm[1] = room_speed * DEFAULT_COO_INTERVAL;
	}
}

// STATE_ASLEEP
// -------------------------------------------------------
else if(state == STATE_ASLEEP)
{
	if(oMyWorldController.time == "day")
	{
		state = STATE_AWAKE;
		exit;
	}
	
	if(alarm[2] == -1)
	{
		alarm[2] = room_speed * DEFAULT_ZZZ_INTERVAL;
	}
}

// STATE_CRYING
// -------------------------------------------------------
else if(state == STATE_CRYING)
{
	
	if(alarm[0] == -1)
	{
		cryInterval = DEFAULT_CRY_INTERVAL
		alarm[0] = room_speed * DEFAULT_CRY_INTERVAL;
	}
}