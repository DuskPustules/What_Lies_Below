if place_meeting(x, y, oPlayer) {
	global.keysCollected += 1;
	if global.keysCollected == 4 {
		oFinalBossDoor.unlocked = true;
	}
	instance_destroy();
}