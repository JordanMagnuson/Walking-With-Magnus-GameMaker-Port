package game.plains
{
	import game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Tree extends Item
	{	
		/**
		 * Graphics
		 */
		// SECTION DONE
		[Embed(source = '../../../assets/plains/tree01.png')] private const SPRITE01:Class;	
		[Embed(source = '../../../assets/plains/tree02.png')] private const SPRITE02:Class;	
		[Embed(source = '../../../assets/plains/tree03.png')] private const SPRITE03:Class;			
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02, SPRITE03);
		
		
		public function Tree() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			//DONE
			super(rawSprite, 'mid', true);		// DONE
			type = 'tree';		// DONE
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}