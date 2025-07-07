switch room {
	case rmMenuMain:
		if swapCooldown == 0 {
			if keyboard_check(ord("W")) and oMenuExit.selected == true {
				oMenuPlay.selected = true;
				oMenuExit.selected = false;
				swapCooldown = 20;
			} else if keyboard_check(ord("S")) and oMenuPlay.selected == true {
				oMenuPlay.selected = false;
				oMenuExit.selected = true;
				swapCooldown = 20;
			}
		}
		if oMenuPlay.selected == true and keyboard_check(vk_enter) {
			room_goto(rmMenuSaveFiles);
			swapCooldown = 10;
		} else if oMenuExit.selected == true and keyboard_check(vk_enter) {
			game_end();
		}
		break
		
	case rmMenuSaveFiles:
		if swapCooldown == 0 {
			if oMenuSaveFile1.selected == true {
				if keyboard_check(ord("S")) {
					oMenuSaveFile1.selected = false; 
					oMenuSaveFile2.selected = true;
					swapCooldown = 20;
				} else if keyboard_check(ord("D")) {
					oMenuSaveFile1.selected = false
					oMenuDeleteSave1.selected = true
					swapCooldown = 20;
				}
			} else if oMenuSaveFile2.selected == true {
				if keyboard_check(ord("S")) {
					oMenuSaveFile2.selected = false; 
					oMenuSaveFile3.selected = true;
					swapCooldown = 20;
				} else if keyboard_check(ord("W")) {
					oMenuSaveFile2.selected = false; 
					oMenuSaveFile1.selected = true;
					swapCooldown = 20;
				} else if keyboard_check(ord("D")) {
					oMenuSaveFile2.selected = false
					oMenuDeleteSave2.selected = true
					swapCooldown = 20;
				}
			} else if oMenuSaveFile3.selected == true {
				if keyboard_check(ord("W")) {
					oMenuSaveFile3.selected = false; 
					oMenuSaveFile2.selected = true;
					swapCooldown = 20;
				} else if keyboard_check(ord("D")) {
					oMenuSaveFile3.selected = false
					oMenuDeleteSave3.selected = true
					swapCooldown = 20;
				}
			} else if oMenuDeleteSave1.selected == true {
				if keyboard_check(ord("S")) {
					oMenuDeleteSave1.selected = false
					oMenuDeleteSave2.selected = true
					swapCooldown = 20;
				} else if keyboard_check(ord("A")) {
					oMenuDeleteSave1.selected = false
					oMenuSaveFile1.selected = true
				}
			} else if oMenuDeleteSave2.selected == true {
				if keyboard_check(ord("W")) {
					oMenuDeleteSave2.selected = false
					oMenuDeleteSave1.selected = true
				} else if keyboard_check(ord("S")) {
					oMenuDeleteSave2.selected = false
					oMenuDeleteSave3.selected = true
				} else if keyboard_check(ord("A")) {
					oMenuDeleteSave2.selected = false
					oMenuSaveFile2.selected = true
				}
			} else if oMenuDeleteSave3.selected == true {
				if keyboard_check(ord("W")) {
					oMenuDeleteSave3.selected = false
					oMenuDeleteSave2.selected = true
					swapCooldown = 20;
				} else if keyboard_check(ord("A")) {
					oMenuDeleteSave3.selected = false
					oMenuSaveFile3.selected = true
				}
			}
			
			if keyboard_check(vk_enter) {
				if oMenuSaveFile1.selected == true {
					oHudMenu.fileUsed = "saveFile1.ini"
					if oMenuSaveFile1.empty != true and file_exists("saveFile1.ini") {
						loading("saveFile1.ini");
					} else {
						room_instance_add(rmForest, 1280, 365, oPlayer);
						room_goto(rmForest);
					}
				} else if oMenuSaveFile2.selected == true {
					oHudMenu.fileUsed = "saveFile2.ini"
					if oMenuSaveFile2.empty != true and file_exists("saveFile2.ini") {
						loading("saveFile2.ini");
					} else {
						room_instance_add(rmForest, 1280, 365, oPlayer);
						room_goto(rmForest);
					}
				} else if oMenuSaveFile3.selected == true {
					oHudMenu.fileUsed = "saveFile3.ini"
					if oMenuSaveFile3.empty != true and file_exists("saveFile3.ini") {
						loading("saveFile3.ini");
					} else {
						room_instance_add(rmForest, 1280, 365, oPlayer);
						room_goto(rmForest);
					}
				} else if oMenuDeleteSave1.selected == true {
					deleting("saveFile1.ini")
				} else if oMenuDeleteSave2.selected == true {
					deleting("saveFile2.ini")
				} else if oMenuDeleteSave3.selected == true {
					deleting("saveFile3.ini")
				}
			}
		}		if keyboard_check(vk_backspace) {
			room_goto(rmMenuMain);
		}
		break
	case rmMenuDied:
		if swapCooldown == 0 {
			if keyboard_check(ord("D")) and oMenuDiedExit.selected == true {
				oMenuDiedContinue.selected = true;
				oMenuDiedExit.selected = false;
				swapCooldown = 20;
			} else if keyboard_check(ord("A")) and oMenuDiedContinue.selected == true {
				oMenuDiedContinue.selected = false;
				oMenuDiedExit.selected = true;
				swapCooldown = 20;
			}
		}
		if oMenuDiedContinue.selected == true and keyboard_check(vk_enter) {
			loading(oHudMenu.fileUsed);
		} else if oMenuDiedExit.selected == true and keyboard_check(vk_enter) {
			game_end();
		}
		break
}
if swapCooldown != 0 {
	swapCooldown --;
}