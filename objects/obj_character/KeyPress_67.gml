/// @description Dash

if (!place_meeting(x, y + 1, obj_abstract_collision))
{
	exit;
}

audio_play_sound(snd_dash, 0, false, global.sound_volume / 100.0);

if (facing > 0)
{
	sprite_index = spr_character_dash_right;
}
else
{
	sprite_index = spr_character_dash_left;
}

dashing = true;
alarm_set(0, dash_duration);
