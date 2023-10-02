/// @description Insert description here
// You can write your code in this editor

if (!isFalling)
{
	exit;
}

vspeed = 0
isFalling = false

var curr_x = x
var curr_y = y

x = -1000
y = -1000

var _iter = 0;
while place_meeting(curr_x, curr_y,obj_abstract_block) && _iter < 5
{
	curr_y -= 1
	_iter += 1;
}

x = curr_x
y = curr_y

obj_logic_controller.number_in_order--

if (controlled)
{
	controlled = false;
	obj_logic_controller.controlled_block_set = false;
}


