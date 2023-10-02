function scr_play_land()
{
	var _variation = irandom_range(0, 2);
	if (_variation == 0)
	{
		audio_play_sound(snd_land1, 0, false, global.sound_volume / 100.0);
	}
	if (_variation == 1)
	{
		audio_play_sound(snd_land2, 0, false, global.sound_volume / 100.0);
	}
	if (_variation == 2)
	{
		audio_play_sound(snd_land3, 0, false, global.sound_volume / 100.0);
	}
}