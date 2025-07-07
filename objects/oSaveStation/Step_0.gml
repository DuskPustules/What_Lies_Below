if place_meeting(x, y, oPlayer) and oPlayer.interactKey == 1 {
	saving(oHudMenu.fileUsed);
}
if place_meeting(x, y - 10, oPlayer) {
	if arrowCreated = false {
		instance_create_layer(x, y - 36, "Instances", oInteractArrow)
		show_debug_message("created at: " + string(x) + ", " + string(y - 36))
	}
	arrowCreated = true;
	arrowDestroyed = false;
} else if global.NPC = "" and arrowDestroyed == false {
	arrowCreated = false;
	instance_destroy(oInteractArrow);
	arrowDestroyed = true
}