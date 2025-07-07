if dropDirection == "down" {
	y += ySpd;
}
if breakCountdown != 0 {
	breakCountdown --;
}
if place_meeting(x, y, oMeleeHitbox) {
	instance_create_depth(x, y - 8, 0, oHP);
	instance_destroy();
}
if (place_meeting(x, y, oWall) or place_meeting(x, y, oSemiWall)) and breakCountdown == 0 {
	leftFragmentDirection = {moveDir:"left"}
	rightFragmentDirection = {moveDir:"right"}
	instance_create_depth(bbox_left, bbox_top+8, 0, oFinalBossDropsFragments, leftFragmentDirection)
	instance_create_depth(bbox_right, bbox_top+8, 0, oFinalBossDropsFragments, rightFragmentDirection)
	instance_destroy();
}

if place_meeting(x, y, oPlayer) and oPlayer.hitInvincFrames == 0 {
	oPlayer.Attacked(40)
}