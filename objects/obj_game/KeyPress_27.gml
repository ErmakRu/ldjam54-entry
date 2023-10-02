/// @description Insert description here

if (global.gamestate == "game")
{
	audio_stop_sound(snd_main_theme);
	room_goto(room_main_menu);
}
