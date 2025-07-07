if place_meeting(x, y, oMeleeHitbox) and hitCooldown == 0 and oPlayer.weaponDamage >= 40 {
	if shellBroken {
		hitAnimationFrames = 5;
		hitCooldown = 30;
		HP -= oPlayer.weaponDamage;
		show_debug_message("hit");
	} else {
		show_debug_message("crack")
		shellHealth -= oPlayer.weaponDamage;
		hitCooldown = 30;
		if shellHealth <= 0 {
			shellBroken = true;
		}
	}
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