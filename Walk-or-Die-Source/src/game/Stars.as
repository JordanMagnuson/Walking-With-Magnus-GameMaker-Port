package game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Stars extends Entity
	{
		//SECTION DONE
		public var fadeTween:ColorTween;
		
		public var startedFadeOut:Boolean = false;
		public var releasedMeteorShower:Boolean = false;
		
		public const SHOOTING_STAR_FREQ:Number = Night.DURATION / 3 + 1;	// 2 times per night
		public var shootingStarAlarm:Alarm;
		
		public const METEOR_SHOWER_FREQ:Number = Night.FADE_IN_DURATION - 5;	// 1 time per night
		public var meteorShowerAlarm:Alarm;
		/**
		 * Graphic
		 */
		[Embed(source='../../assets/stars.png')] private const SPRITE:Class;
		public var image:Image = new Image(SPRITE);	
		//======================================================

		//SECTION DONE
		public function Stars() 
		{
			image.alpha = 0;
			graphic = image;
			layer = 500;
		}
		
		//DONE
		override public function added():void
		{
			fadeIn();
			
			// Shooting star alarm
			shootingStarAlarm = new Alarm(SHOOTING_STAR_FREQ, releaseShootingStar);
			addTween(shootingStarAlarm);
			shootingStarAlarm.start();
			
			// Meteor Shower alarm
			meteorShowerAlarm = new Alarm(METEOR_SHOWER_FREQ, releaseMeteorShower);
			addTween(meteorShowerAlarm);
			meteorShowerAlarm.start();
		}		
		
		//DONE
		override public function update():void
		{
			super.update();
			(graphic as Image).alpha = fadeTween.alpha;
			
			// Testing
			if (Input.pressed(Key.M))
 			{
				trace('m presesd');
				this.releaseMeteorShower();
			}			
		}		
		
		// FUNCTION DONE
		public function releaseShootingStar():void
		{
			shootingStarAlarm.reset(SHOOTING_STAR_FREQ);
			if (!startedFadeOut)
			{
				var direction:int = FP.choose(-1, 1);
				if (FP.random < 0.15)
				{
					FP.world.add(new ShootingStar(direction));
					trace('released shooting star');
				}		
			}
		}
		
		//DONE
		public function releaseMeteorShower():void
		{
			//meteorShowerAlarm.reset(METEOR_SHOWER_FREQ);			
			trace('release meteor shower chance');
			trace('FP.random: ' + FP.random);
			if (!MeteorShower.SEEN)
			{
				if (FP.random < 0.1)
				{
					MeteorShower.SEEN = true;
					FP.world.add(new MeteorShower);
				}	
			}
		}
		
		//DONE
		public function fadeIn():void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(Night.FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, 1);
		}				
		
		//DONE
		public function fadeOut():void
		{
			startedFadeOut = true;
			removeTween(fadeTween);
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(Night.FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, image.alpha, 0);			
		}		
		
		//DONE
		public function destroy():void
		{
			FP.world.remove(this);
		}			
		
	}

}