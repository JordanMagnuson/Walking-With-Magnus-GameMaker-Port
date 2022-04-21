STATE_AWAKE = 1;
STATE_ASLEEP = 2;
STATE_CRYING = 3;
STATE_ALARMED = 4;

DEFAULT_CRY_INTERVAL = 5;
DEFAULT_COO_INTERVAL = 1;
DEFAULT_ZZZ_INTERVAL = 1;

cryInterval = DEFAULT_CRY_INTERVAL;

cryingSoundArray = [];
SND_CRYING_01 = crying_01;
SND_CRYING_02 = crying_02;
SND_CRYING_03 = crying_03;
SND_CRYING_04 = crying_04;
SND_CRYING_05 = crying_05;
SND_CRYING_06 = crying_06;
SND_CRYING_07 = crying_07;
SND_CRYING_08 = crying_08;
SND_CRYING_09 = crying_09;
SND_CRYING_10 = crying_10;
SND_CRYING_11 = crying_11;
SND_CRYING_12 = crying_12;
SND_CRYING_13 = crying_13;
SND_CRYING_14 = crying_14;
SND_CRYING_15 = crying_15;
SND_CRYING_16 = crying_16;
SND_CRYING_17 = crying_17;

babySoundArray = [];
SND_BABY_01 = short_sound_01;
SND_BABY_02 = short_sound_02;
SND_BABY_03 = short_sound_03;
SND_BABY_04 = short_sound_04;
SND_BABY_05 = short_sound_05;
SND_BABY_06 = short_sound_06;
SND_BABY_07 = short_sound_07;
SND_BABY_08 = short_sound_08;
SND_BABY_09 = short_sound_09;
SND_BABY_10 = short_sound_12;
SND_BABY_11 = short_sound_11;
SND_BABY_12 = short_sound_12;
SND_BABY_13 = short_sound_13;
SND_BABY_14 = short_sound_14;
SND_BABY_15 = short_sound_15;
SND_BABY_16 = short_sound_16;
SND_BABY_17 = short_sound_17;
SND_BABY_18 = short_sound_18;
SND_BABY_19 = short_sound_19;
SND_BABY_20 = short_sound_20;
SND_BABY_21 = short_sound_21;
SND_BABY_22 = short_sound_22;
SND_BABY_23 = short_sound_23;
SND_BABY_24 = short_sound_24;

bEmit0 = audio_emitter_create();
bEmit1 = audio_emitter_create();

//NEED TO FIND A WAY TO FILL ARRAY WITH SOUNDS
//build crying sound array
for(var i = 1; i <= 17; i++)
{
	if(i < 10)
	{
		cryingSoundArray[i-1] = SND_CRYING_01;
	}

	else
	{
		cryingSoundArray[i-1] = SND_CRYING_01;
	}
}

//NEED TO FIND A WAY TO FILL ARRAY WITH SOUNDS
//build baby sound array
for(var j = 1; j <= 24; j++)
{
	if(j < 10)
	{
		cryingSoundArray[j-1] = SND_CRYING_01;
	}

	else
	{
		cryingSoundArray[j-1] = SND_CRYING_01;
	}
}

show_debug_message("baby created");
state = STATE_AWAKE;

//inital start of alarm, the function will then repeat it
alarm[0] = room_speed * DEFAULT_CRY_INTERVAL;
alarm[1] = room_speed * DEFAULT_COO_INTERVAL;
alarm[2] = room_speed * DEFAULT_ZZZ_INTERVAL;

//start crying right away
cryInterval = 0.5;
alarm[0] = room_speed * cryInterval;


function cry()
{
	show_debug_message("cry");
	if(oPlayer.timeSinceWalking > 1)
	{
		cryInterval -= 0.5;
		if(cryInterval < 0.5)
		{
			cryInterval = 0.5;	
		}
	}
	else
	{
		// Walking: cry less.
		cryInterval += 1;
		
		// Stop Crying
		if(cryInterval > DEFAULT_CRY_INTERVAL + 1)
		{
			show_debug_message("stopCrying");
			state = STATE_AWAKE;
			cryInterval = DEFAULT_CRY_INTERVAL;
			alarm[0] = -1;
			return; //somewhat unsure about this
		}
	}
	
	// Play Sound and reset Alarm
	sound = playRandomCryingSound();
	if(cryInterval < audio_sound_length(sound))
	{
		alarm[0] = room_speed * audio_sound_length(sound);
	}
	else
	{
		alarm[0] = room_speed * cryInterval;
	}
	show_debug_message("cryInterval: " + string(cryInterval));
}

function chanceOfCoo()
{
	show_debug_message("coo (maybe)");
	
	if(state == STATE_AWAKE)
	{
		if(random_range(0,1) < 0.25 && !babySoundPlaying())
		{
			show_debug_message("yes play coo sound");
			sound = playRandomBabySound();
		}
		alarm[1] = room_speed * DEFAULT_COO_INTERVAL;
	}
	else
	{
		alarm[1] = -1;
	}
}

function releaseZZZ()
{
	//show_debug_message("RELEASE ZZZ");
	if(state == STATE_ASLEEP)
	{
		if(global.babyType == "stroller")
		{
			var temp = instance_create_depth(x,y,depth,oZ)
			temp.zConstruct(x, y - 18);
		}
		else
		{
			var temp = instance_create_depth(x,y,depth,oZ)
			temp.zConstruct(x - 4,y - 13);	
		}
		alarm[2] = room_speed * DEFAULT_ZZZ_INTERVAL;
	}
	else
	{
		alarm[2] = -1;	
	}
}

function cryingSoundPlaying()
{
	show_debug_message("cryingSoundPlaying");
}

function babySoundPlaying()
{
	show_debug_message("babySoundPlaying");
}

function playRandomCryingSound(vol = 1)
{
	//just for testing purposes
	show_debug_message("playRandomCryingSound");
	sound = cryingSoundArray[1];
	audio_emitter_gain(bEmit0, vol);
	audio_play_sound_on(bEmit0, sound, false, 20);
	return sound;
}

function playRandomBabySound()
{
	show_debug_message("playRandomBabySound");
}

