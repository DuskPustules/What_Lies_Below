if place_meeting(x, y, oPlayer) and spawnCooldown == 0 {
	var closestInstance = instance_nearest(x, y, oEnemyResourceFlySpawner)
	if instance_nearest(x, y, oEnemyResourceFlySpawner) {
		oEnemyResourceFlySpawner.spawnEnemy = true
	}
	spawnCooldown = 300;
	show_debug_message("in range")
}
if spawnCooldown != 0 {
	spawnCooldown --;
}