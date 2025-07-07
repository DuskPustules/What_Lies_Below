switch room {
	case rmItemDropBottom:
		if turnAroundCooldown == 0 {
			xSpd = xSpd * -1
			turnAroundCooldown = 120
		}
		break
}
x += xSpd;
turnAroundCooldown --;