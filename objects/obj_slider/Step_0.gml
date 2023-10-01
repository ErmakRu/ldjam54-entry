/// @description Insert description here
// You can write your code in this editor
if (!mouse_check_button(mb_left)) {
	grab = false	
}

if (grab == false) && (clicked == false)
{
	exit
} else {
	if ((mouse_x + xx) > leftLimit) && ((mouse_x + xx < rightLimit)) {
		x = mouse_x + xx	
	}
	else if ((mouse_x + xx) < leftLimit) {
		x = leftLimit	
	}
	else if ((mouse_x + xx) > rightLimit) {
		x = rightLimit	
	}
}

percentage = round(((x-leftLimit)/(rightLimit - leftLimit))*100)
audio_sound_gain(ost, percentage/100, 0);
clicked = false