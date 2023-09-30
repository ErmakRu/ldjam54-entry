/// @description Insert description here
// You can write your code in this editor


	vspeed = falling_speed
	if place_meeting(x, y-4, obj_player)
	{
		obj_game.player_alive = false
        instance_destroy(obj_player)
		obj_game.alarm[1] = 20
	}






