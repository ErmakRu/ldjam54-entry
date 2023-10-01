/// @description Dash

if (!place_meeting(x, y + 1, obj_abstract_collision))
{
	exit;
}

sprite_index = spr_character_dash;

dashing = true;
alarm_set(0, dash_duration);
