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


function cry()
{
	show_debug_message("CRY");
}

function chanceOfCoo()
{
	show_debug_message("CHANCE OF COO");
}

function releaseZZZ()
{
	show_debug_message("RELEASE ZZZ");
}