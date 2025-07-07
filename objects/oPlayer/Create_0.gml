function onGroundSet(val = true) {
	if val == true {
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		myFloorPlat = noone;
		coyoteHangTimer = 0;
	}
}
controlSetup();

//gamePaused = false;
//pauseMenuDisplay = false;

depth = -1
//Stats
	HP = 100;
	maxHP = 100; // initially 100, increases by 100 each upgrade
	healthUpgradeAmount = 0;
	PP = 0;
	maxPP = 0; // initially 0, increases by 100 each upgrade
	powerUpgradeAmount = 0;
	powerActive = false;
	hitInvincFrames = 0;
	dialogueTrigger = false;
	dialogueCooldown = 0;
	textbox = false;
	checkpoint = false;
	
//Melee
	weaponDamage = 20; // Damage initially 20, Is 40 when upgraded
	meleeSpawn = 0;
	meleeDirection = "";
	meleeCooldown = 0;
	hitboxDelete = 0;

//Sprites
	maskSpr = sChrI;
	idleSpr = sChrI;
	walkSpr = sChrWalk;
	crouchSpr = sChrC;
	jumpSpr = sChrJ;
	meleeLeftSpr = sChrMeleeL;
	meleeRightSpr = sChrMeleeR;
	meleeUpSpr = sChrMeleeU;
	meleeLeftUpgradeSpr = sChrMeleeUpgradeL;
	meleeRightUpgradeSpr = sChrMeleeUpgradeR;
	meleeUpUpgradeSpr = sChrMeleeUpgradeU;

//Moving
	facing = 1;
	moveDir = 0;
	moveSpd = 1.6;
	xSpd = 0;
	ySpd = 0;
	
//Jumping
	grav = 0.25;
	termVel = 6;
	onGround = true;
	boostJump = false
	jumpMax = 1; //Jump amount initially 1, Is 2 when upgraded
	jumpCount = 0;
	jumpHoldTimer = 0;

	//for singular jumps
	jumpHoldFrames[0] = 15;
	jumpSpd[0] = -3.8;

	//for double jumps after upgrade collected
	jumpHoldFrames[1] = 40;
	jumpSpd[1] = -1.5;

	//Coyote Time
	coyoteHangTimer = 0;
	coyoteHangFrames = 3;
	coyoteJumpTimer = 0;
	coyoteJumpFrames = 5;
	
//Moving Platforms
	myFloorPlat = noone;
	movePlatXSpd = 0;
	movePlatMaxYSpd = 8;
	lastYPosition = noone;
	lastXPosition = noone;