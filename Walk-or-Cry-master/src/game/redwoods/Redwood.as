package game.redwoods
{
	import game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Redwood extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = "../../../assets/redwoods/redwood_01.png")] private const SPRITE01:Class;	
		[Embed(source="../../../assets/redwoods/redwood_02.png")] private const SPRITE02:Class;		
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02);
		
		
		public function Redwood() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			image.flipped = FP.choose(true, false);
			type = 'redwood';
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}