if oPlayer.onGround == false {
	xSpd = oPlayer.xSpd;
	ySpd = oPlayer.ySpd;
} else {
	xSpd = 0;
	try {
		if instance_exists(oPlayer.myFloorPlat) {
			if oPlayer.myFloorPlat.ySpd > 0 {
				ySpd = oPlayer.myFloorPlat.ySpd
			} else {
				ySpd = oPlayer.myFloorPlat.ySpd
			}
		}
	}
}
x += xSpd
y += ySpd