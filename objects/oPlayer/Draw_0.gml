//facing direction
if sprite_index == meleeLeftSpr or sprite_index == meleeRightSpr or sprite_index == meleeUpSpr 
or sprite_index == meleeLeftUpgradeSpr or sprite_index == meleeRightUpgradeSpr or sprite_index == meleeUpUpgradeSpr{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*facing, image_yscale, image_angle, image_blend, image_alpha);
}

//Dialogue Trigger
	if ((interactKey == 1 and dialogueTrigger == true) or textbox == true) and dialogueCooldown == 0 {
		textbox = true;
		show_debug_message("generate dialogue")
		oTextBoxHandler.dialogueHandler()
	}