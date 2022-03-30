package game
{
	import flash.filesystem.File;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import rooms.MyWorld;
	
	public class Baby extends Entity
	{
		// States.
		public var state:int;
		public const STATE_AWAKE:int = 1;
		public const STATE_ASLEEP:int = 2;
		public const STATE_CRYING:int = 3;
		public const STATE_ALARMED:int = 4;
		
		// State contants.
		public static const DEFAULT_CRY_INTERVAL:Number = 5;
		public static const DEFAULT_COO_INTERVAL:Number = 1;	
		public static const DEFAULT_ZZZ_INTERVAL:Number = 1;
		
		// State variables and alarms.
		public var cryInterval:Number = DEFAULT_CRY_INTERVAL;
		public var cryAlarm:Alarm = new Alarm(DEFAULT_CRY_INTERVAL, cry);		
		public var cooAlarm:Alarm = new Alarm(DEFAULT_COO_INTERVAL, chanceOfCoo);	
		public var zzzAlarm:Alarm = new Alarm(DEFAULT_ZZZ_INTERVAL, releaseZZZ);
		
		/**
		 * Sound
		 */		
		
		// Crying
		public var cryingSoundArray:Array = new Array();
		[Embed(source = "../../assets/baby/crying_01.mp3")] private const SND_CRYING_01:Class;
		[Embed(source = "../../assets/baby/crying_02.mp3")] private const SND_CRYING_02:Class;
		[Embed(source = "../../assets/baby/crying_03.mp3")] private const SND_CRYING_03:Class;
		[Embed(source = "../../assets/baby/crying_04.mp3")] private const SND_CRYING_04:Class;
		[Embed(source = "../../assets/baby/crying_05.mp3")] private const SND_CRYING_05:Class;
		[Embed(source = "../../assets/baby/crying_06.mp3")] private const SND_CRYING_06:Class;
		[Embed(source = "../../assets/baby/crying_07.mp3")] private const SND_CRYING_07:Class;
		[Embed(source = "../../assets/baby/crying_08.mp3")] private const SND_CRYING_08:Class;
		[Embed(source = "../../assets/baby/crying_09.mp3")] private const SND_CRYING_09:Class;
		[Embed(source = "../../assets/baby/crying_10.mp3")] private const SND_CRYING_10:Class;
		[Embed(source = "../../assets/baby/crying_11.mp3")] private const SND_CRYING_11:Class;
		[Embed(source = "../../assets/baby/crying_12.mp3")] private const SND_CRYING_12:Class;
		[Embed(source = "../../assets/baby/crying_13.mp3")] private const SND_CRYING_13:Class;
		[Embed(source = "../../assets/baby/crying_14.mp3")] private const SND_CRYING_14:Class;
		[Embed(source = "../../assets/baby/crying_15.mp3")] private const SND_CRYING_15:Class;
		[Embed(source = "../../assets/baby/crying_16.mp3")] private const SND_CRYING_16:Class;
		[Embed(source = "../../assets/baby/crying_17.mp3")] private const SND_CRYING_17:Class;
		
		// Short sounds.
		public var babySoundArray:Array = new Array();
		[Embed(source = "../../assets/baby/short_sound_01.mp3")] private const SND_BABY_01:Class;
		[Embed(source = "../../assets/baby/short_sound_02.mp3")] private const SND_BABY_02:Class;
		[Embed(source = "../../assets/baby/short_sound_03.mp3")] private const SND_BABY_03:Class;
		[Embed(source = "../../assets/baby/short_sound_04.mp3")] private const SND_BABY_04:Class;
		[Embed(source = "../../assets/baby/short_sound_05.mp3")] private const SND_BABY_05:Class;
		[Embed(source = "../../assets/baby/short_sound_06.mp3")] private const SND_BABY_06:Class;
		[Embed(source = "../../assets/baby/short_sound_07.mp3")] private const SND_BABY_07:Class;
		[Embed(source = "../../assets/baby/short_sound_08.mp3")] private const SND_BABY_08:Class;
		[Embed(source = "../../assets/baby/short_sound_09.mp3")] private const SND_BABY_09:Class;
		[Embed(source = "../../assets/baby/short_sound_12.mp3")] private const SND_BABY_10:Class;
		[Embed(source = "../../assets/baby/short_sound_11.mp3")] private const SND_BABY_11:Class;
		[Embed(source = "../../assets/baby/short_sound_12.mp3")] private const SND_BABY_12:Class;
		[Embed(source = "../../assets/baby/short_sound_13.mp3")] private const SND_BABY_13:Class;
		[Embed(source = "../../assets/baby/short_sound_14.mp3")] private const SND_BABY_14:Class;
		[Embed(source = "../../assets/baby/short_sound_15.mp3")] private const SND_BABY_15:Class;
		[Embed(source = "../../assets/baby/short_sound_16.mp3")] private const SND_BABY_16:Class;
		[Embed(source = "../../assets/baby/short_sound_17.mp3")] private const SND_BABY_17:Class;
		[Embed(source = "../../assets/baby/short_sound_18.mp3")] private const SND_BABY_18:Class;		
		[Embed(source = "../../assets/baby/short_sound_19.mp3")] private const SND_BABY_19:Class;
		[Embed(source = "../../assets/baby/short_sound_20.mp3")] private const SND_BABY_20:Class;
		[Embed(source = "../../assets/baby/short_sound_21.mp3")] private const SND_BABY_21:Class;
		[Embed(source = "../../assets/baby/short_sound_22.mp3")] private const SND_BABY_22:Class;
		[Embed(source = "../../assets/baby/short_sound_23.mp3")] private const SND_BABY_23:Class;
		[Embed(source = "../../assets/baby/short_sound_24.mp3")] private const SND_BABY_24:Class;		
		
		public function Baby() 
		{
			// Build crying sound array.
			for (var i:int = 1; i <= 17; i++) 
			{
				if (i < 10) 
				{
					cryingSoundArray[i-1] = new Sfx(this["SND_CRYING_0" + i]);
				}
				else 
				{
					cryingSoundArray[i-1] = new Sfx(this["SND_CRYING_" + i]);
				}
			}	
			// Build baby sound array.
			for (var j:int = 1; j <= 24; j++) 
			{
				if (j < 10) 
				{
					babySoundArray[j-1] = new Sfx(this["SND_BABY_0" + j]);
				}
				else 
				{
					babySoundArray[j-1] = new Sfx(this["SND_BABY_" + j]);
				}
			}
			
			trace('baby created');
			state = STATE_AWAKE;
			//startCryingAlarm.active = false;		
		}
		
		override public function added():void
		{
			addTween(cryAlarm);
			addTween(cooAlarm);
			addTween(zzzAlarm);
			cooAlarm.start();
			cryAlarm.start();
			zzzAlarm.start();
			
			// Stary crying right away.
			cryInterval = 0.5;
			cryAlarm.reset(cryInterval);			
		}
		
		override public function update():void 
		{
			super.update();
			//trace('state: ' + state);
			//trace('sndCryingHard.volume:' + sndCryingHard.volume);
			
			x = Global.player.x + 14;
			y = Global.player.y;
			
			// STATE_AWAKE
			// -------------------------------------------------------
			checkState:if (state == STATE_AWAKE) 
			{

				// Change state?
				changeState:if ((FP.world as MyWorld).time == 'night')
				{
					state = STATE_ASLEEP;
					break checkState;
				}
				else if (Player.timeSinceWalking > 1)
				{
					state = STATE_CRYING;
					break checkState;
				}
				
				// Do this state.
				if (!cooAlarm.active) {
					cooAlarm.reset(DEFAULT_COO_INTERVAL);
					cooAlarm.active = true;
				}
			}
			
			// STATE_ASLEEP
			// -------------------------------------------------------			
			else if (state == STATE_ASLEEP)
			{
				// Change state?
				changeState:if ((FP.world as MyWorld).time == 'day')
				{
					state = STATE_AWAKE;
					break checkState;
				}
				
				// Do this state.	
				if (!zzzAlarm.active) 
				{
					zzzAlarm.reset(DEFAULT_ZZZ_INTERVAL);
					zzzAlarm.active = true;
				}
			}
			
			// STATE_CRYING
			// -------------------------------------------------------	
			else if (state == STATE_CRYING)
			{
				// Change state?
				// Nothing to do: we check for change during alarm callback.
				
				// Do this state.
				if (!cryAlarm.active) 
				{
					cryInterval = DEFAULT_CRY_INTERVAL;
					cryAlarm.reset(DEFAULT_CRY_INTERVAL);
					cryAlarm.active = true;
				}
			}
		}

		/**
		 * STATE_AWAKE alarm callback.
		 */		
		public function chanceOfCoo():void {
			trace('coo (maybe)');
			if (state == STATE_AWAKE)
			{
				if (FP.random < 0.25 && !babySoundPlaying()) {
					trace('yes play coo sound');
					var sound:Sfx = playRandomBabySound();
				}
				cooAlarm.reset(DEFAULT_COO_INTERVAL);
			}			
			else {
				cooAlarm.active = false;
			}
			
		}
		
		/**
		 * STATE_CRYING alarm callback.
		 */
		public function cry():void {
			trace('cry');
			if (Player.timeSinceWalking > 1)
			{
				// Not walking: cry more.
				cryInterval -= 0.5;
				if (cryInterval < 0.5) {
					cryInterval = 0.5;
				}
			}
			else 
			{
				// Walking: cry less.
				cryInterval += 1;
				
				// Stop crying.
				if (cryInterval > DEFAULT_CRY_INTERVAL + 1) {
					trace('stopCrying');
					state = STATE_AWAKE;
					cryInterval = DEFAULT_CRY_INTERVAL;
					cryAlarm.active = false;
					return;
				}
			}
			
			// Play sound and reset alarm.
			var sound:Sfx = playRandomCryingSound();
			if (cryInterval < sound.length) {
				cryAlarm.reset(sound.length);
			}
			else {
				cryAlarm.reset(cryInterval);
			}			
			trace('cryInterval: ' + cryInterval);
		}	
		
		public function releaseZZZ():void 
		{
			//var randX:Number = x + FP.choose( -1, 1) * FP.rand(5);
			if (state == STATE_ASLEEP) 
			{
				if (Global.babyType == "stroller") {
					FP.world.add(new Z(x, y - 18));
				}
				else {
					FP.world.add(new Z(x - 4, y - 13));
				}
				zzzAlarm.reset(DEFAULT_ZZZ_INTERVAL);
			}
			else 
			{
				zzzAlarm.active = false;
			}
		}
		
		public function cryingSoundPlaying():Boolean
		{
			for (var i:String in cryingSoundArray) 
			{ 
				if (cryingSoundArray[i].playing) 
				{
					return true;
				}
			}
 			return false;			
		}
		
		public function babySoundPlaying():Boolean 
		{
			for (var i:String in babySoundArray) 
			{ 
				if (babySoundArray[i].playing) 
				{
					return true;
				}
			}
 			return false;
		}
		
		public function playRandomCryingSound(vol:Number = 1):Sfx 
		{
			//trace('crying sound array length: ' + cryingSoundArray.length);
			var idx:int = Math.floor(Math.random() * cryingSoundArray.length);
			trace(idx);
			var sound:Sfx = cryingSoundArray[idx];		
			sound.play(vol);
			return sound;
		}		
		
		public function playRandomBabySound(vol:Number = 1):Sfx 
		{
			//trace('baby sound array length: ' + babySoundArray.length);
			var idx:int = Math.floor(Math.random() * babySoundArray.length);
			trace(idx);
			var sound:Sfx = babySoundArray[idx];		
			sound.play(vol);
			return sound;
		}
	}
}