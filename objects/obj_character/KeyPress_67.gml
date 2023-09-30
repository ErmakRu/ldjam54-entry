/// @description Dash

if (!place_meeting(x - dash_distance_check * facing, y, obj_abstract_collision))
{
	sprite_index = spr_character_dash;
}
else
{
	sprite_index = spr_character_idle;
}

dashing = true;
hspeed = 1 * facing * dash_rate;
alarm_set(0, dash_duration);
