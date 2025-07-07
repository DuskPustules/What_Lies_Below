function dialogueHandler(){
	show_debug_message(global.NPC)
	switch global.NPC {
		case "OM":
			if oPlayer.x <= 3750 {
				oPlayer.x += 1;
			} else {
				oPlayer.facing = -1;
				var OMdialogue = ["'ello mate, how are ya?",
				"Not much of a talker, eh?",
				"While you're passin' by, I just happened to notice that that sword of yours \nlooks strikingly like them metal creatures that've springin' up 'round here.", 
				"A group of youngins earlier said they've been havin' trouble with 'em, so \nI'd stay out of the little beggers ways if I were you.", 
				"Sorry to hold you up but, if your entering them ruins down there, You better \nbe proper careful 'cause they look pretty deep.",
				"Wouldn' want you getting hurt now, would we?"];
				
				if index <= string_length(OMdialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				    global.textToDisplay += string_char_at(OMdialogue[global.textIndex], index);
				    index += 1;
				    letterGenerateCooldown = 4;
				} else if index > string_length(OMdialogue[global.textIndex]) and textGenerating == true {
					textGenerating = false
				}
				if letterGenerateCooldown != 0 {
					letterGenerateCooldown --;
				}
				
				if keyboard_check(ord("E")) {
					if global.textCooldown == 0 and textGenerating = false {
						global.textCooldown = 10;
						global.textIndex += 1;
						global.textToDisplay = ""
						index = 1
						letterGenerateCooldown = 4
						textGenerating = true
					} else if textGenerating = true and global.textCooldown == 0 {
						global.textToDisplay = OMdialogue[global.textIndex];
						index = string_length(OMdialogue[global.textIndex]) + 1
						textGenerating = false
						global.textCooldown = 10;
					}
				} else if global.textCooldown > 0 {
					global.textCooldown--;
				}
				
				if global.textIndex == 6 {
					global.textCooldown = 60;
					global.textIndex = 0;
					global.textToDisplay = ""
					oPlayer.dialogueTrigger = false;
					oPlayer.textbox = false;
					oPlayer.dialogueCooldown = 120;
					global.NPC = "";
					instance_destroy(oTextboxBG);
				}
			}
			break

		case "sign1":
			oPlayer.facing = 1;
			var sign1dialogue = ["*The heavily eroded sign reads:*",
			"'Wel_ome t_ the City _f Entenria'\n'T_e Re_lm of Eter_al Fr_ed_m and Prosperi_y'"];
				
			if index <= string_length(sign1dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				global.textToDisplay += string_char_at(sign1dialogue[global.textIndex], index);
				index += 1;
				letterGenerateCooldown = 4;
			} else if index > string_length(sign1dialogue[global.textIndex]) and textGenerating == true {
				textGenerating = false;
			}
			if letterGenerateCooldown != 0 {
				letterGenerateCooldown --;
			}
			
			if keyboard_check(ord("E")) {
				if global.textCooldown == 0 and textGenerating = false {
					global.textCooldown = 10;
					global.textIndex += 1;
					global.textToDisplay = ""
					index = 1
					letterGenerateCooldown = 4
					textGenerating = true
					show_debug_message("start generating")
				} else if textGenerating = true and global.textCooldown == 0 {
					global.textToDisplay = sign1dialogue[global.textIndex];
					index = string_length(sign1dialogue[global.textIndex]) + 1
					textGenerating = false
					global.textCooldown = 10;
				}
			} else if global.textCooldown > 0 {
				global.textCooldown--;
			}
				
			if global.textIndex == 2 {
				global.textCooldown = 60;
				global.textIndex = 0;
				global.textToDisplay = ""
				oPlayer.dialogueTrigger = false;
				oPlayer.textbox = false;
				oPlayer.dialogueCooldown = 120;
				global.NPC = "";
				instance_destroy(oTextboxBG);
			}
			break

		case "sign2":
			oPlayer.facing = 1;
			var sign2dialogue = ["*The well preserved sign reads:*",
			"'New Entenria Update No. 7'",
			"'In recent mining operations at the deepest point of the town, \nwe've just discovered a new undiscovered tunnel!'", 
			"'In this tunnel, we've also found a new metal and some strange \nred gas leaking out from deeper down'",
			"'We plan to venture deeper tomorrow and will give details in later updates'"];
			show_debug_message("created")
				
			if index <= string_length(sign2dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				global.textToDisplay += string_char_at(sign2dialogue[global.textIndex], index);
				index += 1;
				letterGenerateCooldown = 4;
				show_debug_message("generating")
			} else if index > string_length(sign2dialogue[global.textIndex]) and textGenerating == true {
				textGenerating = false
			}
			if letterGenerateCooldown != 0 {
				letterGenerateCooldown --;
			}
				
			if keyboard_check(ord("E")) {
				if global.textCooldown == 0 and textGenerating = false {
					global.textCooldown = 10;
					global.textIndex += 1;
					global.textToDisplay = ""
					index = 1
					letterGenerateCooldown = 4
					textGenerating = true
				} else if textGenerating = true and global.textCooldown == 0 {
					global.textToDisplay = sign2dialogue[global.textIndex];
					index = string_length(sign2dialogue[global.textIndex]) + 1
					textGenerating = false
					global.textCooldown = 10;
					show_debug_message("start generating")
				}
			} else if global.textCooldown > 0 {
				global.textCooldown--;
			}
				
			if global.textIndex == 5 {
				global.textCooldown = 60;
				global.textIndex = 0;
				global.textToDisplay = ""
				oPlayer.dialogueTrigger = false;
				oPlayer.textbox = false;
				oPlayer.dialogueCooldown = 120;
				global.NPC = "";
				instance_destroy(oTextboxBG);
			}
			break
			
		case "sign3":
			if oPlayer.x >= 366 {
				oPlayer.x -= 1;
			} else {
				oPlayer.facing = 1;
				var sign3dialogue = ["*The slightly cracked sign reads:*",
				"'Entenria Update No. 17'",
				"'Through our thorough research into materials collected from mining \noperations, although we thought throughout that it had some new applications'", 
				"'We could have never expected to create what we can only describe as an \nartificial lifeform created through harnessing the new red energy found recently'",
				"'Further research will be done into these creations'"];
				
				if index <= string_length(sign3dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				    global.textToDisplay += string_char_at(sign3dialogue[global.textIndex], index);
				    index += 1;
				    letterGenerateCooldown = 4;
				} else if index > string_length(sign3dialogue[global.textIndex]) and textGenerating == true {
					textGenerating = false
				}
				if letterGenerateCooldown != 0 {
					letterGenerateCooldown --;
				}
				
				if keyboard_check(ord("E")) {
					if global.textCooldown == 0 and textGenerating = false {
						global.textCooldown = 10;
						global.textIndex += 1;
						global.textToDisplay = ""
						index = 1
						letterGenerateCooldown = 4
						textGenerating = true
					} else if textGenerating = true and global.textCooldown == 0 {
						global.textToDisplay = sign3dialogue[global.textIndex];
						index = string_length(sign3dialogue[global.textIndex]) + 1
						textGenerating = false
						global.textCooldown = 10;
					}
				} else if global.textCooldown > 0 {
					global.textCooldown--;
				}
				
				if global.textIndex == 5 {
					global.textCooldown = 60;
					global.textIndex = 0;
					global.textToDisplay = ""
					oPlayer.dialogueTrigger = false;
					oPlayer.textbox = false;
					oPlayer.dialogueCooldown = 120;
					global.NPC = "";
					instance_destroy(oTextboxBG);
				}
			}
			break

		case "sign4":
			if oPlayer.x >= 580 {
				oPlayer.x -= 1;
			} else {
				oPlayer.facing = 1;
				var sign4dialogue = ["*The hastily written sign reads:*",
				"'Entenria Update No. 42'",
				"'Ever since the breakthrough, everything has spiraled out of our control. \nThe lifeforms became self-sufficiant very quickly.'",
				"'The lower part of the city has started to be, what we can only describe as, \nconsumed by the metal creatures.'",
				"'Please leave the town as soon as you can and inform others to do so as well.'",
				"'We are currently researching ways to mitigate this problem.'"];
				
				if index <= string_length(sign4dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				    global.textToDisplay += string_char_at(sign4dialogue[global.textIndex], index);
				    index += 1;
				    letterGenerateCooldown = 4;
				} else if index > string_length(sign4dialogue[global.textIndex]) and textGenerating == true {
					textGenerating = false
				}
				if letterGenerateCooldown != 0 {
					letterGenerateCooldown --;
				}
				
				if keyboard_check(ord("E")) {
					if global.textCooldown == 0 and textGenerating = false {
						global.textCooldown = 10;
						global.textIndex += 1;
						global.textToDisplay = ""
						index = 1
						letterGenerateCooldown = 4
						textGenerating = true
					} else if textGenerating = true and global.textCooldown == 0 {
						global.textToDisplay = sign4dialogue[global.textIndex];
						index = string_length(sign4dialogue[global.textIndex]) + 1
						textGenerating = false
						global.textCooldown = 10;
					}
				} else if global.textCooldown > 0 {
					global.textCooldown--;
				}
				
				if global.textIndex == 2 {
					global.textCooldown = 60;
					global.textIndex = 0;
					global.textToDisplay = ""
					oPlayer.dialogueTrigger = false;
					oPlayer.textbox = false;
					oPlayer.dialogueCooldown = 120;
					global.NPC = "";
					instance_destroy(oTextboxBG);
				}
			}
			break
			
		case "campNPC1":
			if oPlayer.x >= 366 {
				oPlayer.x -= 1;
			} else {
				oPlayer.facing = 1;
				var campNPC1dialogue = ["Oh Hullo, trav'llu", 
				"Wasnae expectin' others 'ere since the bridge fell out",
				"Anyway, since your daein' just fine so I'll tell ye what we're 'ere fir",
				"These here ruins were said to have 'hings like a grand fountain and archways and \ntha' but we couldnae find any aw them, so it was a bit disappointing for us, ye ken?",
				"If ye wanna know stuff about this area, [name] is checkin' oot somein' or other\n down that way"];
				 
				if index <= string_length(campNPC1dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				    global.textToDisplay += string_char_at(campNPC1dialogue[global.textIndex], index);
				    index += 1;
				    letterGenerateCooldown = 4;
				} else if index > string_length(campNPC1dialogue[global.textIndex]) and textGenerating == true {
					textGenerating = false
				}
				if letterGenerateCooldown != 0 {
					letterGenerateCooldown --;
				}
				
				if keyboard_check(ord("E")) {
					if global.textCooldown == 0 and textGenerating = false {
						global.textCooldown = 10;
						global.textIndex += 1;
						global.textToDisplay = ""
						index = 1
						letterGenerateCooldown = 4
						textGenerating = true
					} else if textGenerating = true and global.textCooldown == 0 {
						global.textToDisplay = campNPC1dialogue[global.textIndex];
						index = string_length(campNPC1dialogue[global.textIndex]) + 1
						textGenerating = false
						global.textCooldown = 10;
					}
				} else if global.textCooldown > 0 {
					global.textCooldown--;
				}
				
				if global.textIndex == 5 {
					global.textCooldown = 60;
					global.textIndex = 0;
					global.textToDisplay = ""
					oPlayer.dialogueTrigger = false;
					oPlayer.textbox = false;
					oPlayer.dialogueCooldown = 120;
					global.NPC = "";
					instance_destroy(oTextboxBG);
				}
			}
			break

		case "campNPC2":
			if oPlayer.x >= 366 {
				oPlayer.x -= 1;
			} else {
				oPlayer.facing = 1;
				var campNPC2dialogue = ["Bloomin' long way down there, ain't it.",
				"for some reason I just can't draw myself away from the edge though",
				"........................................................................",
				"............................Hang on, you aren't [name]. Are you new here?",
				"Guess it's nice to have company though, since [name] don't talk to me that much \nthese days"];
				
				if index <= string_length(campNPC2dialogue[global.textIndex]) and letterGenerateCooldown == 0 {
				    global.textToDisplay += string_char_at(campNPC2dialogue[global.textIndex], index);
				    index += 1;
				    letterGenerateCooldown = 4;
				} else if index > string_length(campNPC2dialogue[global.textIndex]) and textGenerating == true {
					textGenerating = false
				}
				if letterGenerateCooldown != 0 {
					letterGenerateCooldown --;
				}
				
				if keyboard_check(ord("E")) {
					if global.textCooldown == 0 and textGenerating = false {
						global.textCooldown = 10;
						global.textIndex += 1;
						global.textToDisplay = ""
						index = 1
						letterGenerateCooldown = 4
						textGenerating = true
					} else if textGenerating = true and global.textCooldown == 0 {
						global.textToDisplay = campNPC2dialogue[global.textIndex];
						index = string_length(campNPC2dialogue[global.textIndex]) + 1
						textGenerating = false
						global.textCooldown = 10;
					}
				} else if global.textCooldown > 0 {
					global.textCooldown--;
				}
				
				if global.textIndex == 5 {
					global.textCooldown = 60;
					global.textIndex = 0;
					global.textToDisplay = ""
					oPlayer.dialogueTrigger = false;
					oPlayer.textbox = false;
					oPlayer.dialogueCooldown = 120;
					global.NPC = "";
					instance_destroy(oTextboxBG);
				}
			}
			break
	}
}