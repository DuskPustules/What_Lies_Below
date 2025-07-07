if y < oPlayer.bbox_top and xSpd == 0 {
	heightReached = true
	xSpd = 2.5;
}
if heightReached == true and ySpd != 0 {
	ySpd = 0;
}

y -= ySpd;
x += xSpd * facing

if place_meeting(x, y, oMeleeHitbox) {
	HP -= oPlayer.weaponDamage;
	show_debug_message("Hit")
}
if HP <= 0 {
	instance_destroy()
}
if place_meeting(x, y, oPlayer) and oPlayer.hitInvincFrames == 0 {
	oPlayer.Attacked(30)
}