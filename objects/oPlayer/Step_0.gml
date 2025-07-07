if !textbox {
	getControls();
}

//X Movement
	moveDir = rightKey - leftKey;
	//Get Facing
	if moveDir != 0 {facing = moveDir;};
	
	if textbox == true or sprite_index == crouchSpr or (sprite_index == walkSpr && crouchKey == 1) or (instance_exists(oMeleeHitbox) and onGround == true) {
		xSpd = 0;
	} else {
		xSpd = moveDir * moveSpd;
	}

//X Collision
	var subPixel = 0.5;
	if place_meeting(x + xSpd, y, oWall) {
		//Upward Slope Check
		if !place_meeting(x + xSpd, y - abs(xSpd) - 1, oWall) { 
			while place_meeting(x + xSpd, y, oWall) {y -= subPixel;}
		} else {
			//Ceiling Slope check
			if !place_meeting(x + xSpd, y + abs(xSpd) + 1, oWall) {
				while place_meeting(x + xSpd, y, oWall) {y += subPixel;}
			} else {
				//Collision Precision
				var pixelCheck = subPixel * sign(xSpd);
				while !place_meeting(x + pixelCheck, y, oWall) {
					x += pixelCheck;
				}
				xSpd = 0;
			}
		}
	}
	
	//Downward Slope Check
	if ySpd >= 0 && !place_meeting(x + xSpd, y + 1, oWall) && place_meeting(x + xSpd, y + abs(xSpd) + 1, oWall) {
		while !place_meeting(x + xSpd, y + subPixel, oWall) {y += subPixel;}
	}
	
	//Move X
	x += xSpd

//Y Movement
	//Gravity
	if coyoteHangTimer > 0 {
		coyoteHangTimer--;
	} else {
		ySpd += grav
		onGroundSet(false)
	}
	
	//Jump count check
	if onGround == true {
		jumpCount = 0;
		jumpHoldTimer = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 {jumpCount = 1;}
	}

	//Terminal Velocity
	if ySpd > termVel{ySpd = termVel;};

	//Ititiate Jump
	if jumpKeyBuffered == true && jumpCount < jumpMax {
		jumpKeyBuffered = 0;
		jumpKeyBufferTimer = 0;
		
		jumpCount++;
		
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		onGroundSet(false)
	}
	
	//Jump hold
	if jumpHoldTimer > 0 {
		ySpd = jumpSpd[jumpCount-1];
		jumpHoldTimer--;
	}
	
	if jumpCount == 2 and ySpd < -1 {
		boostJump = true
	} else {
		boostJump = false
	}
	
	if !jumpKey {
		jumpHoldTimer = 0;
	}
	
	//Upwards Y Collision
	if ySpd < 0 && place_meeting(x, y + ySpd, oWall) {
		
		var slopeSlide = false;
		
		//Idle Slide Up Left Slope
		if moveDir == 0 && !place_meeting(x - abs(ySpd) - 1, y + ySpd, oWall) {
			while place_meeting(x, y + ySpd, oWall) {x -= 1;}
			slopeSlide = true;
		}
		
		//Idle Slide Up Right Slope
		if moveDir == 0 && !place_meeting(x + abs(ySpd) + 1, y + ySpd, oWall) {
			while place_meeting(x, y + ySpd, oWall) {x += 1;}
			slopeSlide = true;
		}
		
		//Normal Y Collision
		if !slopeSlide {
			var pixelCheck = subPixel * sign(ySpd);
			while !place_meeting(x, y + pixelCheck, oWall) {
				y += pixelCheck
			}
		
			//Headbonk
			if ySpd < 0 {
				jumpHoldTimer = 0;
			}
		
			ySpd = 0;
		}
	}
	
	//Floor Y Collision
		//Platform Check Under Player
		var clampYSpd = max(0, ySpd)
		var list = ds_list_create(); // list of objects
		var array = array_create(0);
		array_push(array, oWall, oWallMove, oSemiWall, oSemiWallMove, oWallBreak, oWallEnemyShell)
		
		var listSize = instance_place_list(x, y + 1 + clampYSpd + movePlatMaxYSpd, array, list, false);
		
		//Find Platform Player is Standing on
		for(var i = 0; i < listSize; i++) {
			//loop through each platform around player and check if player is standing on it
			var listInst = list[| i];
			
			//Avoid Magnetism
			 //if this line throws an error, the player is standing on a platform that isn't in the list
			if (listInst.ySpd <= ySpd || instance_exists(myFloorPlat))
			&& (listInst.ySpd > 0 || place_meeting(x, y + 1 + clampYSpd, listInst)) {
				//Check if platform is wall or child of wall
				if  listInst.object_index == oWall
				|| object_is_ancestor(listInst.object_index, oWall) 
				|| floor(bbox_bottom) <= ceil(listInst.bbox_top - listInst.ySpd) {
					if !instance_exists(myFloorPlat)
					|| listInst.bbox_top + listInst.ySpd <= myFloorPlat.bbox_top + myFloorPlat.ySpd 
					|| listInst.bbox_top + listInst.ySpd <= bbox_bottom {
						myFloorPlat = listInst;
					}
				}
			}
		}
		//Delete DS list to prevent memeory leak
		ds_list_destroy(list);
		
		//final floor platform check
		if instance_exists(myFloorPlat) && !place_meeting(x, y + movePlatMaxYSpd, myFloorPlat) {
			myFloorPlat = noone;
		}
		
		//If there's ground, land on it
		if instance_exists(myFloorPlat) {
			while !place_meeting(x, y + subPixel, myFloorPlat) && !place_meeting(x, y, oWall) {y += subPixel}
			if myFloorPlat.object_index == oSemiWall
			|| object_is_ancestor(myFloorPlat.object_index, oSemiWall) {
				while place_meeting(x, y, myFloorPlat) {y -= subPixel};
			}
			//Removes Gap between player and ground surface
			y = floor(y)
			
			//Collide with Ground
			ySpd = 0
			onGroundSet(true)
		}
		
	//Move Y
	if textbox == false and onGround == false {
		y += ySpd;
	} else {
		y += 0;
	}
	
//Final Moving Platform Movement
	//Snap to Moving Ground
	if instance_exists(myFloorPlat) && (myFloorPlat.ySpd != 0 
	|| myFloorPlat.object_index == oWallMove
	|| object_is_ancestor(myFloorPlat.object_index, oWallMove)
	|| myFloorPlat.object_index == oSemiWallMove
	|| object_is_ancestor(myFloorPlat.object_index, oSemiWallMove)) {
		if !place_meeting(x, myFloorPlat.bbox_top, oWall)
		&& myFloorPlat.bbox_top >= bbox_bottom-movePlatMaxYSpd {
			y = myFloorPlat.bbox_top
		}
		//Going up into Wall While on Semisolid
		if myFloorPlat.ySpd < 0 && place_meeting(x, y + myFloorPlat.ySpd, oWall) {
			if myFloorPlat.object_index == oSemiWall || object_is_ancestor(myFloorPlat.object_index, oSemiWall) {
				var subPixel = 0.25
				while place_meeting(x, y + myFloorPlat.ySpd, oWall) { y += subPixel; }
				while place_meeting(x, y, oWall) {y += subPixel;}
				y = round(y);
			}
			//Cancel myFloorPlat
			onGroundSet(false)
		}
	}
	
//Melee
	if not textbox {
		if attackKey == 1 && meleeCooldown == 0 {
			if facing == 1 and !upKey {
				meleeDirection = "right"
				if weaponDamage < 30 {
					sprite_index = meleeRightSpr
				} else {
					sprite_index = meleeRightUpgradeSpr;
				}
				image_index = 0
			} else if !upKey {
				meleeDirection = "left"
				if weaponDamage < 30 {
					sprite_index = meleeLeftSpr
				} else {
					sprite_index = meleeLeftUpgradeSpr;
				}
				image_index = 0
			} else {
				meleeDirection = "up"
				if weaponDamage < 30 {
					sprite_index = meleeUpSpr
				} else {
					sprite_index = meleeUpUpgradeSpr;
				}
				image_index = 0
			}
			meleeSpawn = 8;
			meleeCooldown = 30;
			hitboxDelete = 26;
		}
	}
	if meleeSpawn != 0 {meleeSpawn --;} 
	else {
		if meleeDirection == "right" {
			instance_create_layer(x + 16, y - 16, "Instances", oMeleeHitbox)
			instance_create_layer(x + 40, y - 16, "Instances", oMeleeHitbox)
		} else if meleeDirection == "left" {
			instance_create_layer(x - 16, y - 16, "Instances", oMeleeHitbox)
			instance_create_layer(x - 40, y - 16, "Instances", oMeleeHitbox)
		} else if meleeDirection == "up" {
			upMeleeClose = instance_create_layer(x, y - 40, "Instances", oMeleeHitbox)
			upMeleeFar = instance_create_layer(x, y - 64, "Instances", oMeleeHitbox)
		}
	}
	
	if meleeCooldown != 0 {meleeCooldown --;}
	if hitboxDelete != 0 {hitboxDelete --;} else {instance_destroy(oMeleeHitbox)}

//Sprite Control
	if abs(xSpd) == 0 && crouchKey != 1 and meleeCooldown == 0 {
		sprite_index = idleSpr;
	} else if textbox != true and crouchKey == 1 {
		sprite_index = crouchSpr;
	}
	
	if dialogueCooldown != 0 {
		dialogueCooldown --;
	}
	
	if textbox == false and meleeCooldown == 0 {
		//Walking
		if abs(xSpd) > 0 and sprite_index != walkSpr {
			sprite_index = walkSpr;
		}
		//Jumping
		if !onGround {
			sprite_index = jumpSpr;
			if boostJump == true {
				image_index = 0;
			} else {
				if ySpd < -1.5 {
					image_index = 1
				} else if ySpd < 0 {
					image_index = 2
				} else {
					image_index = 3
				}
			}
		}
	}
	//Mask
	mask_index = maskSpr;

//Attacked
	function Attacked(strength) {
		if hitInvincFrames <= 0 {
			oPlayer.HP -= strength;
		}
		oPlayer.hitInvincFrames = 120;
		//oPlayer.hitRedFlash = 5;
	}
	
	if hitInvincFrames > 0 {
		if visible == true {
			visible = false;
		} else {
			visible = true
		}
		hitInvincFrames--;
	}

// Death
	if oPlayer.HP <= 0 {
		instance_destroy(oPlayer);
		room_goto(rmMenuDied);
	}

// Pit and spike respawn
	if myFloorPlat {
		try {
			lastYPosition = myFloorPlat.bbox_top
			lastXPosition = myFloorPlat.x
		} catch(_execution) {};
	}
	
// Set health upgrade amount
	if healthUpgradeAmount > 0 {
		for (var i = healthUpgradeAmount; i = 0; i--;) {
			maxHP += 100
		}
	}