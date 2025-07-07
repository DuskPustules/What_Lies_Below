if place_meeting(x, y, oPlayer) and oPlayer.dialogueCooldown == 0 {
	if arrowCreated = false {
		var arrow = instance_create_layer(x, y - 36, "Instances", oInteractArrow)
		with arrow {
			Identification = "campNPC1"
		}
	}
	arrowCreated = true;
	oPlayer.dialogueTrigger = true;
	global.NPC = "campNPC1"
} else if oPlayer.textbox == true {
	arrowCreated = false
	with (oInteractArrow) {
		if Identification == "campNPC1" {
			instance_destroy(oInteractArrow);
			show_debug_message("destroyed")
		}
	}
	oPlayer.dialogueTrigger = false;
	global.NPC = "campNPC1"
} else {
	arrowCreated = false;
	with (oInteractArrow) {
		if Identification == "campNPC1" {
			instance_destroy(oInteractArrow);
			show_debug_message("destroyed")
		}
	}
	oPlayer.dialogueTrigger = false;
	global.NPC = ""
}