/// @description Insert description here
// You can write your code in this editor

event_inherited()

if (!isFalling) {
exit
}

vspeed = falling_speed


if (!obj_game.player_alive)
{
	exit;
}

if place_meeting(x, y-4, obj_character)
{
	audio_play_sound(snd_squish, 0, false, 1, 0.2);
	scr_die();
}

	

	





