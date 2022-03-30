package game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image
	import flash.display.BlendMode;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.tweens.misc.Alarm;
	import rooms.MyWorld;

	public class Night extends Entity
	{
		/**
		 * Note that DURATION does not include fade out time.
		 */		
		//SECTION DONE
		public static const DURATION:int = 30;
		public static const FADE_IN_DURATION:Number = 6;
		public static const FADE_OUT_DURATION:Number = 10;
		public static const MAX_ALPHA:Number = 0.7;
		//=======================================
		
		public var fadeTween:ColorTween;
		public var durationAlarm:Alarm = new Alarm(DURATION, complete);	
		
		public var stars:Stars = new Stars;
		
		/**
		 * Image
		 */
		//DONE
		[Embed(source = '../../assets/night_cover.png')] private const SPRITE:Class;	
		public var image:Image = new Image(SPRITE);		
		
		//DONE
		public function Night() 
		{
			(FP.world as MyWorld).time = 'night';
			layer = -999;
			image.blend = BlendMode.MULTIPLY;
			image.alpha = 0;
			graphic = image;		
		}
		
		//DONE
		override public function added():void
		{
			addTween(durationAlarm);
			durationAlarm.start();
			fadeIn();
		}
		
		//DONE
		override public function update():void
		{
			super.update();
			(graphic as Image).alpha = fadeTween.alpha;
		}
		
		//DONE
		public function fadeIn():void
		{
			FP.world.add(stars);
			stars.fadeIn();
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, MAX_ALPHA);
		}		
		
		//DONE
		public function fadeOut():void
		{
			//trace('starting fade out');
			stars.fadeOut();
			removeTween(fadeTween);
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, image.alpha, 0);			
		}
		
		//DONE
		public function complete():void
		{
			FP.world.add(new Day(FP.world));
			fadeOut();
		}
		
		/**
		 * Removes night from the world
		 */
		//DONE
		public function destroy():void
		{
			FP.world.remove(this);
		}		
	}
}