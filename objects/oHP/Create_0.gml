show_debug_message("health created");
despawnTimer = 720;
flashIntervalTimer = 16;
amount = 0;

randomize();
size = random(100);
if size <= 40 {
	sprite_index = sHPsmall;
	amount = 10;
	show_debug_message("small")
} else if size > 40 and size <= 55 {
	sprite_index = sHPmedium;
	amount = 20;
	show_debug_message("medium")
} else if size > 55 and size <= 60 {
	sprite_index = sHPLarge;
	amount = 45;
	show_debug_message("Large")
} else {
	show_debug_message("No HP Pickup")
	instance_destroy();
}