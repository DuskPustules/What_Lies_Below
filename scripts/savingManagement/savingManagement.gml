// Saves key variables to the current save file
function saving(file) {
	iniFile = file;
	ini_open(iniFile);
	ini_write_real("player", "x", oPlayer.x);
	ini_write_real("player", "y", oPlayer.y);
	ini_write_real("player", "room", room);
	ini_write_real("player", "HP", oPlayer.HP);
	ini_write_real("player", "maxHP", oPlayer.maxHP);
	ini_write_real("player", "HPlocations", global.HPupgradeLocations);
	ini_write_real("player", "attack", oPlayer.weaponDamage);
	ini_write_real("player", "jump", oPlayer.jumpMax);
	
	var displayMessage = "Saved INI Contents:\n";
	displayMessage += "Player X: " + string(ini_read_real("player", "x", 0)) + "\n";
	displayMessage += "Player Y: " + string(ini_read_real("player", "y", 0)) + "\n";
	displayMessage += "Player Room: " + string(room_get_name(ini_read_real("player", "room", 0))) + "\n";
	displayMessage += "Player HP: " + string(ini_read_real("player", "HP", 0)) + "\n";
	displayMessage += "Player maxHP: " + string(ini_read_real("player", "maxHP", 0)) + "\n";
	show_debug_message(displayMessage);

	ini_close();
}

// loads the key variables from the selected file
function loading(file) {
	show_debug_message("loading attempt with " + string(file))
	iniFile = file

	if file_exists(iniFile) {
		show_debug_message("loading")
	    ini_open(iniFile);
		var loadedRoom = ini_read_real("player", "room", 0);
		var loadedXPosition = ini_read_real("player", "x", 0);
		var loadedYPosition = ini_read_real("player", "y", 0);
		var loadedHP = ini_read_real("player", "HP", 100);
		var loadedMaxHP = ini_read_real("player", "maxHP", 100);
		var loadedAttack = ini_read_real("player", "attack", 0)
		var loadedJump = ini_read_real("player", "jump", 0)
		var loadedHPlocations = ini_read_real("player", "HPlocations", 0)

		room_goto(loadedRoom)
		if !instance_exists(oPlayer) {
			var playerInstance = instance_create_layer(loadedXPosition, loadedYPosition, "Instances", oPlayer)
			with (playerInstance) {
				HP = loadedHP
				maxHP = loadedMaxHP
				weaponDamage = loadedAttack
				jumpMax = loadedJump
			}
		} else {
			oPlayer.x = loadedXPosition
			oPlayer.y = loadedYPosition
			oPlayer.HP = loadedHP
			oPlayer.maxHP = loadedMaxHP
			oPlayer.weaponDamage = loadedAttack
			oPlayer.jumpMax = loadedJump
		}
		global.HPupgradeLocations = loadedHPlocations

		var displayMessage = "Loaded INI Contents:\n";
		displayMessage += "HP Collected: " + string(loadedHPlocations) + "\n";
		displayMessage += "Player HP: " + string(loadedHP) + "\n";
		displayMessage += "Player maxHP: " + string(loadedMaxHP) + "\n";
		displayMessage += "Player weaponDamage: " + string(loadedAttack) + "\n";
		displayMessage += "Player Jump Amount: " + string(loadedJump) + "\n";
	    displayMessage += "Player X: " + string(loadedXPosition) + "\n";
	    displayMessage += "Player Y: " + string(loadedYPosition) + "\n";
		displayMessage += "Player Room: " + string(room_get_name(loadedRoom)) + "\n";
	    show_debug_message(displayMessage);

	    ini_close();
	} else {
		room_instance_add(rmForest, 1280, 365, oPlayer);
		room_goto(rmForest);
	}
}

// Deletes the selected file
function deleting(file) {
	iniFile = file
	show_debug_message("deleting " + string(file))
	if file_exists(iniFile) {
		file_delete(iniFile)
	}
}