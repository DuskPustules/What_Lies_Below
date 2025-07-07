if inRange == true {
	if oPlayer.x > x {
		facing = 1
		if oPlayer.x - x > 50 {
			
		}
	} else {
		facing = -1
	}
}

//Hit
	if place_meeting(x, y, oMeleeHitbox) and hitCooldown == 0 {
		hitAnimationFrames = 5;
		hitCooldown = 30;
		HP -= oPlayer.weaponDamage;
		show_debug_message("Hit")
	} else if hitCooldown > 0 {
		hitCooldown--;
	} else {
		hitCooldown = 0;
	}
	if hitAnimationFrames != 0 {
		hitAnimationFrames -= 1;
		image_index = 2;
	} else {
		image_index = 1;
	}
	if HP <= 0 {
		instance_destroy()
	}
	
//Attack
	if place_meeting(x, y, oPlayer) and oPlayer.hitInvincFrames == 0 {
		oPlayer.Attacked(30)
	}