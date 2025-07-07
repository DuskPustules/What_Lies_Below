//Picking up
if place_meeting(x, y, oPlayer) {
	show_debug_message("picked up expansion")
	oPlayer.maxHP += 100
	oPlayer.HP = oPlayer.maxHP
	show_debug_message("HP is now" + string(oPlayer.HP))
	var HPdata = ds_map_create();
	HPdata[? "room"] = room;
	ds_list_add(global.HPupgradeLocations, HPdata);
	instance_destroy();
}

// Movement
if upDown == 0 {
	if ySpd != 0.5 {
		ySpd += 0.02
		y += ySpd
	} else {
		upDown = 1;
	}
} else {
	if ySpd != -0.5 {
		ySpd += -0.02
		y += ySpd
	} else {
		upDown = 0;
	}
}