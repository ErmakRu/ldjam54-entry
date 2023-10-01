/// @description Insert description here
// You can write your code in this editor

event_inherited()

if (!isFalling) {
exit
}

vspeed = falling_speed



if place_meeting(x, y-4, obj_character)
{

	obj_logic_controller.player_alive = false
    obj_character.visible = false;
	obj_logic_controller.alarm[1] = 20
}

	

	





