function scr_die()
{
	audio_stop_sound(snd_main_theme);
	obj_game.player_alive = false;
	obj_character.visible = false;
	obj_logic_controller.alarm[2] = 250;
}