SPEED = global.player_speed
walking = false;
startedWalking = false;
sleeping = false;
lastPressedKey = 0;
lastPressedAgo = -1;
timeSinceWalking = 0;

//const
DEFAULT_ZZZ_INTERVAL = 1;


worldController = instance_find(oMyWorldController,0)

if(worldController == noone)
	show_debug_message("controller not found")

if(global.babyType == "stroller")
{
	sprite_index = sprStroller
}
else
	sprite_index = sprwalking_frontpack

image_index = 0;
animSpeed = SPEED/10;
image_speed = 0; //start the player animation on standing

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

//Location
x= 50;
y = oGround.y;


function releaseZZZ()
{
	if(sleeping)
	{
		if(global.babyType == "stroller")
		{
			var temp = instance_create_depth(x,y,depth,oZ)
			temp.zConstruct(x + 5,y - 18);
		}
		else
		{
			var temp = instance_create_depth(x,y,depth,oZ)
			temp.zConstruct(x + 6,y - 19);
		}
	}
	alarm[0] = room_speed * DEFAULT_ZZZ_INTERVAL;
}


//inital start of alarm, the function will then repeat it
alarm[0] = room_speed * DEFAULT_ZZZ_INTERVAL;