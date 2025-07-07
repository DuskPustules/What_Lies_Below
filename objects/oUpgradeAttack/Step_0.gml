//Picking Up
if place_meeting(x, y, oPlayer) {
	show_debug_message("picked up upgrade")
	var weaponUpgradeMessage = "Damage was: " + string(oPlayer.weaponDamage)
	oPlayer.weaponDamage += 20
	oPlayer.maxPP = 100;
	weaponUpgradeMessage += " and is now: " + string(oPlayer.weaponDamage)
	show_debug_message(weaponUpgradeMessage)
	
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