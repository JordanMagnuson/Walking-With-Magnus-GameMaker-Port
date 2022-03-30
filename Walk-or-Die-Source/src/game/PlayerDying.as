//FILE DONE
package game
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class PlayerDying extends Entity
	{
		public const FADE_OUT_DURATION:Number = 5;		//DONE
		
		public var graveStoneAlarm:Alarm;
		public var fadeTween:ColorTween;
		
		/**
		 * Player graphic
		 */
		[Embed(source='../../assets/player_dying.png')] private const PLAYER_DYING:Class; //DONE
		public var sprPlayer:Spritemap = new Spritemap(PLAYER_DYING, 22, 17);		
		
		public function PlayerDying() 
		{
			// Graphic
			sprPlayer.add("die", [0, 1, 2, 3, 4], 2, false);	//SECTION DONE
			graphic = sprPlayer;
			sprPlayer.play("die");
			
			// Hit box		//SECTION DONE
			sprPlayer.originX = 0;
			sprPlayer.originY = sprPlayer.height;
			sprPlayer.x = 0;
			sprPlayer.y = -sprPlayer.originY;	
			
			setHitbox(sprPlayer.width, sprPlayer.height, sprPlayer.originX, sprPlayer.originY); //DONE				
			
			// Gravestone alarm						//SUPER CONFUSED ON HOW THE CODE BELOW WORKS, EDITS WILL NEED TO BE DONE HERE
			graveStoneAlarm = new Alarm(5, fadeOut); //CREATE AN ALARM THAT WILL GO OFF IN 5 SECONDS AND THEN RUN THE FADEOUT FUNCTION
			addTween(graveStoneAlarm);	//ADDS THE GRAVESTONE ALARM AS A TWEEN	QUESTION: WHY IS THE ALARM ADDED AS A TWEEN?
			graveStoneAlarm.start();	//STARTS THE TWEEN
			
			fadeTween = new ColorTween;	//CREATES A NEW COLORTWEEN AND CALLS IT FADETWEEN
			fadeTween.alpha = 1;	//SETS THE ALPHA VALUE OF FADETWEEN TO 1
		}
		
		override public function update():void 
		{
			super.update(); //UPDATES THE ENTITY SUPER?
			(graphic as Spritemap).alpha = fadeTween.alpha;	//UPDATES THE ALPHA VALUE OF WHATEVER THIS GRAPHIC IS
		}
		
		public function fadeOut():void
		{
			FP.world.add(new Gravestone); //CREATE NEW GRAVESTONE OBJECT
			fadeTween = new ColorTween(destroy);//WHEN THE CHARACTER HAS FADED AWAY, DESTROY THE CHARACTER OBJECT??
			addTween(fadeTween);	//ADDS THE FADETWEEN COLORTWEEN AS A TWEEN		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, 1, 0);	//TWEENS THE ALPHA FROM 1 TO 0 OVER THE DURATION OF FADE_OUT_DURATION 
				//(START COLOR IS WHITE, END COLOR IS WHITE)	THIS TWEEN FUNCTION IS PART OF COLORTWEEN
		}
		//ORDER OF THE ABOVE FUNCTIONS: SET AN ALARM THAT WILL RUN THE FADEOUT FUNCTION AFTER 5 SECONDS
		//
		
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}
}