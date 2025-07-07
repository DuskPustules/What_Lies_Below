if place_meeting(x, y, oPlayer) {
	show_debug_message("picked up")
	oPlayer.HP += amount
	if oPlayer.HP > oPlayer.maxHP {
		oPlayer.HP = oPlayer.maxHP
	}
	show_debug_message(oPlayer.HP)
	instance_destroy();
}
despawnTimer --;
if despawnTimer < 120 {
	if flashIntervalTimer == 0 {
		if image_index = 1 {
			image_index = 2;
		} else {
			image_index = 1;
		}
		flashIntervalTimer = 6;
	} else if flashIntervalTimer > 0 {
		flashIntervalTimer --;
	}
} else {
	image_index = 2;
}
if despawnTimer == 0 {
	instance_destroy();
}