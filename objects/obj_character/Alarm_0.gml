/// @description Dash stop

dashing = false;
if (!place_meeting(x, y - 1, obj_abstract_collision))
{
	sprite_index = spr_character_idle;
}
else
{
	crawling = true;
}
