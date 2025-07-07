if instance_exists(oPlayer) {
	if global.textToDisplay != "" or oPlayer.textbox == true {
		if !instance_exists(oTextboxBG) {
			instance_create_depth((camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2), 
			((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 88), -200, oTextboxBG)
		} else {
			oTextboxBG.x = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2)
			oTextboxBG.y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 88
		}
		
		var text = global.textToDisplay
		var xPosition = camera_get_view_width(view_camera[0]) / 2 - 100
		var yPosition = camera_get_view_height(view_camera[0]) / 2 - 60
		draw_set_font(fDialogue)
		draw_text_transformed(xPosition, yPosition, text, 1.2, 1.2, 0)
		
	} else {
		var hudText = "Health: " + string(oPlayer.HP)
		draw_set_font(fMenu)
		draw_text(40, 40, hudText)
	}
} else {
	if room == rmMenuMain {
		var menuCredit = "Created by Hamish Brannan-Horobin";
		var screenWidth = display_get_gui_width();
		var screenHeight = display_get_gui_height();
		var drawX = screenWidth / 2;
		var drawY = screenHeight - 10;
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_set_font(fCredit)
		draw_text(drawX, drawY, menuCredit);
	} else {
		draw_set_halign(fa_left)
		draw_set_valign(fa_top);
	}
}
if room != rmMenuMain or rmMenuDied or rmMenuSaveFiles {
	pauseGame();
}
// Fullscreen Toggle
if keyboard_check_pressed(vk_f11) {
    window_set_fullscreen(!window_get_fullscreen());
}