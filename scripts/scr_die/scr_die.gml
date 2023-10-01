function scr_die()
{
	audio_stop_sound(snd_main_theme);
	audio_play_sound(snd_death, 0, false, 1, -1);
	obj_game.player_alive = false;
	obj_character.visible = false;
	obj_logic_controller.alarm[1] = 250;
}