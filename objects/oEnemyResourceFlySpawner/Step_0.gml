if spawnEnemy == true and oPlayer.bbox_bottom <= bbox_bottom {
	instance_create_depth(x, y, 1, oEnemyResourceFly)
	spawnEnemy = false
}