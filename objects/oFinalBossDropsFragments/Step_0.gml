y -= ySpd 
x += xSpd 

ySpd -= grav

if place_meeting(x, y, oWall) {
	instance_destroy();
}

if place_meeting(x, y, oMeleeHitbox) {
	instance_create_depth(x, y - 8, 0, oHP);
	instance_destroy();
}

if place_meeting(x, y, oPlayer) and oPlayer.hitInvincFrames == 0 {
	oPlayer.Attacked(20)
}