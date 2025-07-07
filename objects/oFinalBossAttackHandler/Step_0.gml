randomize();

if attackTrigger == true {
	attackSpawn = random(100);
	
	if attackSpawn <= 20 {
		instance_create_depth(1796, 472, 0, oFinalBossDrops);
		attackTrigger = false
	} else if attackSpawn > 20 and attackSpawn <= 40 {
		instance_create_depth(1868, 472, 0, oFinalBossDrops);
		attackTrigger = false
	} else if attackSpawn > 40 and attackSpawn <= 60 {
		instance_create_depth(1968, 472, 0, oFinalBossDrops);
		attackTrigger = false
	} else if attackSpawn > 60 and attackSpawn <= 80 {
		instance_create_depth(2068, 472, 0, oFinalBossDrops);
		attackTrigger = false
	} else if attackSpawn > 80 and attackSpawn <= 100 {
		instance_create_depth(2140, 472, 0, oFinalBossDrops);
		attackTrigger = false
	}
}