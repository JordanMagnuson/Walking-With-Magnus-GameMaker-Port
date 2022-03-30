package game 
{
	import flash.events.IMEEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Z extends Entity
	{
		public static const RISE_SPEED:Number = 0.1;
		public static const FADE_OUT_DURATION:Number = 2;
		
		public var fading:Boolean = false;
		public var fadeTween:ColorTween;	
		
		[Embed(source = "../../assets/zzz.png")] private const ZZZ:Class;	
		
		public function Z(x:Number = 0, y:Number = 0) 
		{
			//graphic = new Image(ZZZ)
			super(x, y, new Image(ZZZ));
		}
		
		override public function added():void
		{
			fadeOut();
		}
		
		override public function update():void 
		{
			y -= RISE_SPEED;
			x += RISE_SPEED;
			//(graphic as Image).angle -= 0.1;
			
			if (fading)
				(graphic as Image).alpha = fadeTween.alpha;			
		}
		
		public function fadeOut():void
		{
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, 1, 0);	
			fading = true;
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}		
		
	}

}