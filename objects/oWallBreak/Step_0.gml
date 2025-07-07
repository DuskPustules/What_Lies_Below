if place_meeting(x, y, oMeleeHitbox) and oPlayer.weaponDamage > 30 and cooldown == 0 {
	if strength <= 0 {
		show_debug_message("wall broken");

		var wall_data = ds_map_create();
		wall_data[? "room"] = room;
		wall_data[? "x"] = x;
		wall_data[? "y"] = y;
		ds_list_add(global.brokenWalls, wall_data);
		
		switch room {
			case rmItemCorridor1:
				if instance_exists(oCameraRightBlocker) {
					instance_destroy(oCameraRightBlocker);
				}
				break
		}
		instance_destroy();
	} else {
		show_debug_message("wall damaged")
		strength -= 1;
		shake = 8; 
		cooldown = 25;
	} 
}
if shake != 0 {
	if direct == 1 {
		show_debug_message("shake right")
		x += 1;
		direct = 0;
	} else if direct == 0 {
		show_debug_message("shake left")
		x -= 1;
		direct = 1;
	}
	shake -= 1;
}
if cooldown > 0 {
	cooldown --;
}