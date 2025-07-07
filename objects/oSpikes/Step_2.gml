if place_meeting(x, y, oPlayer) {
	oPlayer.HP -= 10
	if !oPlayer.checkPointPassed {
		show_debug_message("hit spikes")
		oPlayer.x = oPlayer.lastXPosition
		oPlayer.y = oPlayer.lastYPosition
	} else {
		show_debug_message("checkpoint")
		oPlayer.x = oPlayer.checkPointPosition[0]
		oPlayer.y = oPlayer.checkPointPosition[1]
	}
}