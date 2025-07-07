if place_meeting(x, y, oPlayer) {
	if arrowCreated = false {
		instance_create_layer(x, y - 36, "Instances", oInteractArrow);
	}
	arrowCreated = true;
	oPlayer.dialogueTrigger = true;
	global.NPC = "sign1";
} else if oPlayer.textbox == true {
	arrowCreated = false;
	instance_destroy(oInteractArrow);
	oPlayer.dialogueTrigger = false;
	global.NPC = "sign1";
} else {
	arrowCreated = false;
	oPlayer.dialogueTrigger = false;
	global.NPC = "";
}
if global.NPC == "" {
	instance_destroy(oInteractArrow);
}