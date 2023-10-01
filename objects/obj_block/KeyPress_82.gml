/// @description Insert description here

if (!isFalling) {
	exit;
}

image_angle += 90

var curr_x = x
var curr_y = y

x = -1000
y = -1000

if place_meeting(curr_x, curr_y, obj_abstract_collision)
{
	image_angle -= 90
}

x = curr_x
y = curr_y



