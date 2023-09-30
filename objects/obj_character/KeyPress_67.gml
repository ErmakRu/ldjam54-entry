/// @description Dash

if (!place_meeting(x, y + 1, obj_abstract_collision))
{
	exit;
}

sprite_index = spr_character_dash;

dashing = true;
hspeed = 1 * facing * dash_rate;
alarm_set(0, dash_duration);
