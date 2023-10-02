/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (obj_character.y - y < y_cutoff)
{
	hspeed = 0;
	exit;
}

hspeed = (obj_character.x - x) * following_speed_factor;

if (x + hspeed < 0 || x + hspeed > room_width || place_meeting(x + hspeed, y, obj_abstract_collision))
{
	hspeed = 0;
}
