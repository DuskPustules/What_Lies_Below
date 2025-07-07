if place_meeting(x, y, oPlayer) {
	triggered = true
}
if triggered == true and oPlayer.onGround == true and spawned != true {
	instance_create_depth(1968, 500, 1, oFinalBoss);
	show_debug_message("Spawned")
	spawned = true
}