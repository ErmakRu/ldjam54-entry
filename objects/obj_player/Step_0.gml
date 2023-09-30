/// @description Insert description here
// You can write your code in this editor


if keyboard_check(ord("A")) {
	if (hspeed>-4) {
		hspeed += -1
	}
}

if keyboard_check(ord("D")) {
	if (hspeed<4) {
		hspeed += 1
	}
}

if keyboard_check(vk_nokey) {
	while (hspeed!=0) {
		if (hspeed > 0) {
			hspeed -= 2
			if (hspeed <0) {
				hspeed = 0
			}
		}
		else if (hspeed<0) {
			hspeed += 2
			if (hspeed > 0) {
				hspeed = 0
			}
		}
	}
}

