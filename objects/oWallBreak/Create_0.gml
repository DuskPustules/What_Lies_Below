ySpd = 0;
xSpd = 0;

switch room {
	case rmTreeAscent:
		if y < 1000 and x < 600 {
			sprite_index = sWallBreakStone
		} else {
			sprite_index = sWallBreakWood
		}
}

strength = 2;
cooldown = 0;
direct = 1;
shake = 0;