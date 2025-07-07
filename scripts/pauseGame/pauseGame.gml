function pauseGame() {
	if keyboard_check(vk_escape) {
		instance_deactivate_all(true)
	}
	if keyboard_check(vk_backspace) {
		instance_activate_all()
	}
}