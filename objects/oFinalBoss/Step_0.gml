if inPosition == false {
	ySpd = 1;
	y += ySpd;
	if y == 670 {
		inPosition = true;
	}
} else if weakPointsSet == false {
	instance_create_depth(1909, 686, -5, oFinalBossLEye);
	instance_create_depth(2009, 628, -5, oFinalBossREye);
	weakPointsSet = true;
} else {
	if !instance_exists(oFinalBossAttackHandler) {
		instance_create_depth(20, 20, 0, oFinalBossAttackHandler);
	}
	
	randomize();
	attackRandomizer = random(10);
	
	switch attackPattern {
		case 1:
			if attackCooldown != 0 {
				attackCooldown--
				break
			}
			attackDirectionStruct = {dropDirection:"down"}
			if attackSequence == 1 {
				instance_create_depth(1788, 472, 0, oFinalBossDrops, attackDirectionStruct);
				attackSequence = 2
				attackSequenceDirection = "right"
				
			} else if attackSequence == 2 {
				instance_create_depth(1872, 472, 0, oFinalBossDrops, attackDirectionStruct);
				if attackSequenceDirection == "left" {
					attackSequence = 1
				} else if attackSequenceDirection == "right" {
					attackSequence = 3
				}

			} else if attackSequence == 3 {
				instance_create_depth(1968, 472, 0, oFinalBossDrops, attackDirectionStruct);
				if attackSequenceDirection == "left" {
					attackSequence = 2
				} else if attackSequenceDirection == "right" {
					attackSequence = 4
				}
				
			} else if attackSequence == 4 {
				instance_create_depth(2064, 472, 0, oFinalBossDrops, attackDirectionStruct);
				if attackSequenceDirection == "left" {
					attackSequence = 3
				} else if attackSequenceDirection == "right" {
					attackSequence = 5
				}
				
			} else if attackSequence == 5 {
				instance_create_depth(2148, 472, 0, oFinalBossDrops, attackDirectionStruct);
				attackSequence = 4
				attackSequenceDirection = "left"
			}
			attackCooldown = 70;
			break
			
		case 2:
			if attackCooldown != 0 {
				attackCooldown--;
				break
			}
			if attackSequence == 1 {
				instance_create_depth(1968, 472, 0, oFinalBossDrops, attackDirectionStruct);
				attackSequence = 2
				attackSequenceDirection = "outward"
				
			} else if attackSequence == 2 {
				instance_create_depth(2064, 472, 0, oFinalBossDrops, attackDirectionStruct);
				instance_create_depth(1872, 472, 0, oFinalBossDrops, attackDirectionStruct);
				if attackSequenceDirection == "outward" {
					attackSequence = 3
				} else if attackSequenceDirection == "inward" {
					attackSequence = 1
				}
				
			} else if attackSequence == 3 {
				instance_create_depth(2148, 472, 0, oFinalBossDrops, attackDirectionStruct);
				instance_create_depth(1788, 472, 0, oFinalBossDrops, attackDirectionStruct);
				if attackRandomizer > 5 {
					attackSequence = 1
					attackSequenceDirection = "outward"
				} else {
					attackSequence = 2
					attackSequenceDirection = "inward"
				}
			}
			attackCooldown = 50;
			break
		case 3:
			
			break
	}
}