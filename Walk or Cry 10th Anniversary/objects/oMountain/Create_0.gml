event_inherited();

switch(oLocation.locationType){
	case "forest":
		sprite_index = choose(sprForestMountain01, sprForestMountain02);
		break;
	case "desert":
		sprite_index = choose(sprDesertMountain01, sprDesertMountain02);
		break;
	case "snow":
		sprite_index = choose(sprSnowMountain01, sprSnowMountain02);
		break;
	case "plains":
		sprite_index = choose(sprPlainsMountain01, sprPlainsMountain02);
		break;
	case "beach":
		sprite_index = choose(sprBeachMountain01, sprBeachMountain02);
	default:
		sprite_index = choose(sprForestMountain01, sprForestMountain02);
}
type = "mountain";
Item(sprite_index, "far", true);
