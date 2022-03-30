package game.plains
{
	import game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FlowerTree extends Item
	{	
		/**
		 * Tracks whether this item has yet appeared in the game. 
		 * Most wonders can only be seen once.
		 */
		public static var seen:Boolean = false; //DONE
		
		/**
		 * Graphics
		 */
		[Embed(source = '../../../assets/plains/flower_tree.png')] private const SPRITE01:Class;				
		
		public function FlowerTree() 
		{	
			super(SPRITE01, 'mid', false); //DONE
			type = 'flower_tree'; // DONE
			
			layer = 9; // DONE
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}