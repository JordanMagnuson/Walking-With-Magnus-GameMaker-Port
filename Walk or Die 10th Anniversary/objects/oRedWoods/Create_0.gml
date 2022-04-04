/// @description Insert description here
// You can write your code in this editor
event_inherited();
DAY_SOUND = "sndForestAmbient";
NIGHT_SOUND = "sndForestNightAmbient";
SND_OWL = sndOwl
SND_WOLF = sndWolf
SND_CREAKING = sndCreaking
SND_CICADAS = sndCicadas;

sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

Location(DAY_SOUND, NIGHT_SOUND);
locationType = "redwoods";

function createItem()
{
	oLocation.createItem();
	creationNumber = random_range(0,1);
	
	if(random_range(0,1) < 0.2)
	{
		if(creationNumber < 0.01)
		{
			if(!instance_exists(oRiver))
				instance_create_depth(room_width+10, 175,0, oRiver);
		}
		else if(creationNumber < 1)
		{
			//add redwood
		}
	}
	
	if(random_range(0,1) < 0.4)
	{
		var pan = choose( -1, 1) * random_range(0,1);
		var vol = 0.2 + 0.7 * random_range(0,1); 
		
		if(oMyWorldController.time == "night")
		{
			if(creationNumber < 0.1 && !audio_is_playing(sndOwl))
			{
				sRedWoodEmit0 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit0, vol);
				audio_emitter_position(sRedWoodEmit0, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit0, sndOwl, false, 20);
			}
			
			if(creationNumber < 0.2 && !audio_is_playing(sndWolf))
			{
				sRedWoodEmit1 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit1, vol);
				audio_emitter_position(sRedWoodEmit1, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit1, sndWolf, false, 20);
			}
			if(creationNumber < 0.3 && !audio_is_playing(sndCreaking))
			{
				sRedWoodEmit2 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit2, vol);
				audio_emitter_position(sRedWoodEmit2, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit2, sndCreaking, false, 20);
			}
			if(creationNumber < 0.4 && !audio_is_playing(sndCicadas))
			{
				sRedWoodEmit3 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit3, vol);
				audio_emitter_position(sRedWoodEmit3, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit3, sndCicadas, false, 20);
			}
			
		}
		else
		{
			if(creationNumber < 0.01 && !audio_is_playing(sndOwl))
			{
				sRedWoodEmit0 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit0, vol);
				audio_emitter_position(sRedWoodEmit0, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit0, sndOwl, false, 20);
			}
			
			if(creationNumber < 0.02 && !audio_is_playing(sndWolf))
			{
				sRedWoodEmit1 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit1, vol);
				audio_emitter_position(sRedWoodEmit1, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit1, sndWolf, false, 20);
			}
			if(creationNumber < 0.03 && !audio_is_playing(sndCreaking))
			{
				sRedWoodEmit2 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit2, vol);
				audio_emitter_position(sRedWoodEmit2, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit2, sndCreaking, false, 20);
			}
			if(creationNumber < 0.15 && !audio_is_playing(sndCicadas))
			{
				sRedWoodEmit3 = audio_emitter_create();
				audio_emitter_gain(sRedWoodEmit3, vol);
				audio_emitter_position(sRedWoodEmit3, pan, 0, 0);
				audio_play_sound_on(sRedWoodEmit3, sndCicadas, false, 20);
			}
		}
		
	}
}


function gameStart(){
	//instance_create_depth(150, 175, 0, oFlowers); 
}