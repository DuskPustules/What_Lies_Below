if place_meeting(x, y, oPlayer) {
	switch room {
		case rmForest:
			//Elavator to ruinvert1
			if oPlayer.x > 4000 {
				room_goto(rmVert1)
				oPlayer.x = 240;
				oPlayer.y = -96;
			} else if oPlayer.x < 1000 {
				room_goto(rmLarge1)
				oPlayer.x = 900;
				oPlayer.y = 60;
			}
			break

		case rmVert1:
			//back up to forest
			if oPlayer.y < 200 {
				room_goto(rmForest)
				oPlayer.x = 4224;
				oPlayer.y = 432;
			//tall ledge
			} else if (oPlayer.y > 600 and oPlayer.y < 1000) and oPlayer.x > 200 {
				room_goto(rmHPitem1)
				oPlayer.x = 0;
				oPlayer.y = 208;
			//left save entrance
			} else if (oPlayer.y > 600 and oPlayer.y < 1000) and oPlayer.x < 200 {
				room_goto(rmSave1)
				oPlayer.x = 480;
				oPlayer.y = 208;
			//main corridor entrance
			} else if (oPlayer.y > 1000 and oPlayer.y < 1150) and oPlayer.x < 200 {
				room_goto(rmLcorridor1)
				oPlayer.x = 1500;
				oPlayer.y = 976;
			//breakable wall path
			} else if (oPlayer.y > 1150 and oPlayer.y < 1300) and oPlayer.x > 480 {
				room_goto(rmHangPlatforms)
				oPlayer.x = 0;
				oPlayer.y = 80;
			//bottom path
			} else if oPlayer.y > 1300 and oPlayer.x > 480 {
				room_goto(rmHangPlatforms)
				oPlayer.x = 0;
				oPlayer.y = 384;
			} else if oPlayer.y > 1500 {
				room_goto(rmItemDropTop);
				oPlayer.x = 512;
				oPlayer.y = -26;
			}
			break
			
		// room at the end of the challenge hall
		case rmHPitem1:
			room_goto(rmVert1)
			oPlayer.x = 480;
			oPlayer.y = 768;
			break
			
		case rmHPitem2:
			room_goto(rmLcorridor1);
			oPlayer.x = 0;
			oPlayer.y = 112;
			break
			
		// save room accessed from ruinvert1
		case rmSave1:
			room_goto(rmVert1)
			oPlayer.x = 0;
			oPlayer.y = 880;
			break
			
		// main path accessed from ruinvert1
		case rmLcorridor1:
			if oPlayer.x > 1500 {
				room_goto(rmVert1);
				oPlayer.x = 0;
				oPlayer.y = 1104;
			} else if oPlayer.x < 0 and oPlayer.y > 500 {
				room_goto(rmLarge1);
				oPlayer.x = 2880;
				oPlayer.y = 160;
			} else if oPlayer.x <0 and oPlayer.y < 500 {
				room_goto(rmHPitem2);
				oPlayer.x = 480;
				oPlayer.y = 208;
			}
			break
			
		//Large room accessed from corridor1
		case rmLarge1:
			if oPlayer.x > 2800 and oPlayer.y < 300 {
				room_goto(rmLcorridor1);
				oPlayer.x = 0;
				oPlayer.y = 960;
			} else if oPlayer.x > 2800 and oPlayer.y > 300 {
				room_goto(rmPcorridor);
				oPlayer.x = 0;
				oPlayer.y = 112
			} else if oPlayer.x < 0 and oPlayer.y < 300 {
				room_goto(rmCamp);
				oPlayer.x = 960;
				oPlayer.y = 96;
			} else if oPlayer.x < 0 and oPlayer.y > 300 {
				room_goto(rmCamp);
				oPlayer.x = 960;
				oPlayer.y = 480;
			} else if oPlayer.x < 1000 and oPlayer.y > 1000 {
				room_goto(rmPipeworks);
				oPlayer.x = 2008;
				oPlayer.y = -50;
			}
			break
			
		case rmPcorridor:
			if oPlayer.x < 0 and oPlayer.y < 1000 {
				room_goto(rmLarge1);
				oPlayer.x = 2880;
				oPlayer.y = 560;
			} else if oPlayer.x < 0 and oPlayer.y > 1000 {
				room_goto(rmSave2);
				oPlayer.x = 480;
				oPlayer.y = 208;
			} else if oPlayer.x > 0 and oPlayer.y > 1000 {
				room_goto(rmItemCorridor1);
				oPlayer.x = 0;
				oPlayer.y = 224;
			}
			break
			
		case rmSave2:
			if oPlayer.x > 0 {
				room_goto(rmPcorridor)	
				oPlayer.x = 0;
				oPlayer.y = 1536;
			}
			break
			
		case rmItemCorridor1:
			if oPlayer.x < 0 {
				room_goto(rmPcorridor)
				oPlayer.x = 480;
				oPlayer.y = 1552;
			} else if oPlayer.x > 2500 {
				room_goto(rmTreeAscent);
				oPlayer.x = 695;
				oPlayer.y = 2045;
			}
			break
			
		case rmTreeAscent:
			if oPlayer.x > 600 and oPlayer.y > 1900 {
				room_goto(rmItemCorridor1);
				oPlayer.x = 2710;
				oPlayer.y = 0;
			} else if oPlayer.x > 200 and oPlayer.y < 1000 {
				room_goto(rmHPitem3)
				oPlayer.x = 480;
				oPlayer.y = 208;
			} else if oPlayer.x < 0 and oPlayer.y < 1000 {
				room_goto(rmTreeAscentTop);
				oPlayer.x = 480;
				oPlayer.y = 208;
			}
			break
			
		case rmHPitem3:
			room_goto(rmTreeAscent)
			oPlayer.x = 432
			oPlayer.y = 736
			break
			
		case rmTreeAscentTop:
			if oPlayer.x < 400 and oPlayer.y > 270 {
				room_goto(rmHangPlatforms)
				oPlayer.x = 520;
				oPlayer.y = -22;
			} else if oPlayer.x > 400 and oPlayer.y < 270 {
				room_goto(rmTreeAscent);
				oPlayer.x = 0;
				oPlayer.y = 368;
			}
			break
			
		// side path accessed from bottom of ruinvert1
		case rmHangPlatforms:
			if oPlayer.x < 0 and oPlayer.y < 100 {
				room_goto(rmVert1)
				oPlayer.x = 480;
				oPlayer.y = 1264;
			} else if (oPlayer.y > 100 and oPlayer.y < 400) and oPlayer.x < 0 {
				room_goto(rmVert1);
				oPlayer.x = 480;
				oPlayer.y = 1568;
			}
			break
			
		case rmItemDropTop:
			if oPlayer.y < 500 {
				room_goto(rmVert1);
				oPlayer.x = 240;
				oPlayer.y = 1648;
			} else if oPlayer.y > 500 and oPlayer.x > 200 {
				room_goto(rmItemDropBottom)
				oPlayer.x = 496;
				oPlayer.y = -50;
			} else if oPlayer.y > 500 and oPlayer.x < 200 {
				room_goto(rmItemDropBottom)
				oPlayer.x = 181
				oPlayer.y = 0
			}
			break
			
		case rmItemDropBottom:
			if oPlayer.y < 0 {
				room_goto(rmItemDropTop)
				oPlayer.x = 133;
				oPlayer.y = 1032;
			}
			break
			
		case rmCamp:
			if oPlayer.x < 0 {
				room_goto(rmSave3);
				oPlayer.x = 480;
				oPlayer.y = 208;
			} else if oPlayer.x > 0 and oPlayer.y < 200 {
				room_goto(rmLarge1);
				oPlayer.x = 0;
				oPlayer.y = 272;
			} else if oPlayer.x > 0 and oPlayer.y > 200 {
				room_goto(rmLarge1);
				oPlayer.x = 0;
				oPlayer.y = 672;
			}
			break
		
		case rmSave3:
			if oPlayer.x > 480 {
				room_goto(rmCamp)
				oPlayer.x = 0;
				oPlayer.y = 496;
			}
			break
	}
}