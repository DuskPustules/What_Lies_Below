if place_meeting(x, y, oMeleeHitbox) and hitCooldown == 0 {
	HP -= oPlayer.weaponDamage;
	hitCooldown = 20;
}

if hitCooldown != 0 {hitCooldown--;}

if HP <= 0 {
	leftFragmentDirection = {moveDir:"left"}
	rightFragmentDirection = {moveDir:"right"}
	instance_create_depth(bbox_left, bbox_top+8, 0, oFinalBossDropsFragments, leftFragmentDirection)
	instance_create_depth(bbox_right, bbox_top+8, 0, oFinalBossDropsFragments, rightFragmentDirection)
	oFinalBoss.attackPattern += 1;
	oFinalBoss.attackSequence = 1;
	oFinalBoss.attackCooldown = 50;
	instance_destroy();
}