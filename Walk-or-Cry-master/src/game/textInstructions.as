package game 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.graphics.Text;
	import rooms.MyWorld;
	
	public class textInstructions extends Entity
	{		
		public var text:Text;
		public static const FADE_IN_DURATION:Number = 1;
		public static const FADE_OUT_DURATION:Number = 3;
		public var fadeTween:ColorTween;
		
		public var nextTextAlarm:Alarm = new Alarm(1);
		public var fadeOutAlarm:Alarm = new Alarm(5, fadeOut);
		
		public var fadingOut:Boolean = false;
		//public var fadeOutAlarm:Alarm = new Alarm(3, fadeOut);
		
		public var prevText:Entity;
		
		public function textInstructions(prevText:Entity) 
		{
			this.prevText = prevText;
			text = new Text("Put on headphones, hold stroller, and walk to begin.");
			text.size = 8;
			text.alpha = 0;
			graphic = text;			
			x = 20;
			y = 147;
		}
		
		override public function added():void
		{
			fadeIn();
		}		
		
		override public function update():void
		{
			super.update();
			text.alpha = fadeTween.alpha;
			
			if (Player.startedWalking && !fadingOut)
			{
				fadingOut = true;
				FP.world.addTween(fadeOutAlarm);
				fadeOutAlarm.start();		
			}			
		}
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, 1);
		}				
		
		public function fadeOut():void
		{
			//trace('starting fade out');
			//(prevText as textPress).fadeOut();
			removeTween(fadeTween);
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, text.alpha, 0);			
		}
		
		public function destroy():void
		{
			//(FP.world as MyWorld).titleTextAlarm = new Alarm(2, (FP.world as MyWorld).showTitle);
			//FP.world.addTween((FP.world as MyWorld).titleTextAlarm);
			//(FP.world as MyWorld).titleTextAlarm.start();
			(prevText as textPress).fadeOut();
			FP.world.remove(this);
		}
		
	}

}