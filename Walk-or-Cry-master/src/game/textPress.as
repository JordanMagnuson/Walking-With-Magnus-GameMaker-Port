package game 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.ColorTween;
	
	public class textPress extends Entity
	{		
		public static const FADE_IN_DURATION:Number = 3;
		public static const FADE_OUT_DURATION:Number = 5;

		public static var text:Text;
		public static var fadeTween:ColorTween;		
		
		public static var nextTextAlarm:Alarm;
		public static var fadeOutAlarm:Alarm;
		
		public function textPress() 
		{
			text = new Text("Walking With Magnus");
			text.size = 16;
			text.alpha = 0;
			graphic = text;			
			x = 20;
			y = 130;
			fadeTween = new ColorTween();
			fadeTween.alpha = 1;
			nextTextAlarm = new Alarm(3, nextText);
		}	
		
		override public function update():void
		{
			super.update();
			text.alpha = fadeTween.alpha;
		}
		
		override public function added():void
		{
			fadeIn();
			FP.world.addTween(nextTextAlarm);
			nextTextAlarm.start();			
		}		
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, 1);
		}				
		
		public function nextText():void
		{
			FP.world.add(new textInstructions(this));
		}
		
		public function fadeOut():void
		{
			removeTween(fadeTween);			
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, text.alpha, 0);				
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}