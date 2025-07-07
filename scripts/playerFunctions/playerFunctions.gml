function controlSetup() {
	//Jump Buffer
	bufferTime = 5;
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}

function getControls() {
	//Movement
	rightKey = keyboard_check(ord("D")) + gamepad_button_check(0, gp_padr);
		rightKey = clamp(rightKey, 0, 1);
	leftKey = keyboard_check(ord("A")) + gamepad_button_check(0, gp_padl);
		leftKey = clamp(leftKey, 0, 1);
		
	//Looking Up/Down
	crouchKey = keyboard_check(ord("S")) + gamepad_button_check(0, gp_padd);
		crouchKey = clamp(crouchKey, 0, 1);
	upKey = keyboard_check(ord("W")) + gamepad_button_check(0, gp_padu);
		upKey = clamp(upKey, 0, 1);
		
	//Attack
	attackKey = keyboard_check_pressed(ord("M")) + gamepad_button_check(0, gp_face3);
		attackKey = clamp(attackKey, 0, 1);
		
	//Interact
	interactKey = keyboard_check(ord("E")) + gamepad_button_check(0, gp_face4);
		interactKey = clamp(interactKey, 0, 1);
		
	//Jumping
	jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
		jumpKeyPressed = clamp(jumpKeyPressed, 0, 1)
	jumpKey = keyboard_check(vk_space) + gamepad_button_check_pressed(0, gp_face1);
		jumpKey = clamp(jumpKey, 0, 1);
		
	//Jump Buffer
	if jumpKeyPressed {
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0 {
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer --;
	} else {
		jumpKeyBuffered = 0;
	}
}