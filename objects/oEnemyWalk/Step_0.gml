sprite_index = sEnemy1
image_speed = 1

var subPixel = 0.5;
if ySpd >= 0 && !place_meeting(x + xSpd * moveDir, y + 1, oWall) && place_meeting(x + xSpd * moveDir, y + abs(xSpd) + 1, oWall) {
    while !place_meeting(x + xSpd * moveDir, y + subPixel, oWall) { y += subPixel; }
}

if place_meeting(x + xSpd * moveDir, y, oWall) {
    if !place_meeting(x + xSpd * moveDir, y - abs(xSpd) - 1, oWall) {
        while place_meeting(x + xSpd * moveDir, y, oWall) { y -= subPixel; }
    } else {
        moveDir = moveDir * -1;
        turnedAround = true;
        turnAroundTimer = 30;
    }
}

if !place_meeting(x + (xSpd + 8) * moveDir, y + (xSpd + 8), oWall) && !turnedAround {
    moveDir = moveDir * -1;
    turnedAround = true;
    turnAroundTimer = 60;
}

if turnAroundTimer > 0 {
    turnAroundTimer--;
} else {
    turnedAround = false;
}

x += xSpd * moveDir;
// Ground Collision and Landing Check for Enemy
if place_meeting(x, y + 1, oWall) {
    // Ensure enemy snaps to ground without jitter
    while !place_meeting(x, y + subPixel, oWall) { 
        y += subPixel; 
    }
    y = floor(y); // Snap Y position to prevent minor fluctuations
    ySpd = 0;
    onGround = true;
} else {
    onGround = false;
    ySpd += grav; // Apply gravity if not on the ground
}

// Terminal Velocity Check
if ySpd > termVel {
    ySpd = termVel;
}

// Apply Y Speed
y += ySpd;
	
//Hit
if place_meeting(x, y, oMeleeHitbox) and hitCooldown == 0 {
	hitAnimationFrames = 10;
	hitCooldown = 30;
	HP -= oPlayer.weaponDamage;
} else if hitCooldown > 0 {
	hitCooldown--;
} else {
	hitCooldown = 0;
}
if hitAnimationFrames != 0 {
	hitAnimationFrames -= 1;
	sprite_index = sEnemy1Damaged;
	show_debug_message("hit")
}

if HP <= 0 {
	instance_destroy()
}
	
//Attack
	if place_meeting(x, y, oPlayer) and oPlayer.hitInvincFrames == 0 {
		oPlayer.Attacked(30)
	}