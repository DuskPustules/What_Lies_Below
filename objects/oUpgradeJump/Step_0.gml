//Picking Up
if place_meeting(x, y, oPlayer) {
	show_debug_message("picked up upgrade")
	var weaponUpgradeMessage = "Max no. of jumps was: " + string(oPlayer.jumpMax)
	oPlayer.jumpMax += 1;
	weaponUpgradeMessage += " and is now: " + string(oPlayer.jumpMax)
	show_debug_message(weaponUpgradeMessage)
	instance_destroy(oCameraLeftBlocker);
	instance_destroy(oCameraRightBlocker);
	instance_destroy();
}

// Movement
if upDown == 0 {
	if ySpd != 0.5 {
		ySpd += 0.02
		y += ySpd
	} else {
		upDown = 1;
	}
} else {
	if ySpd != -0.5 {
		ySpd += -0.02
		y += ySpd
	} else {
		upDown = 0;
	}
}