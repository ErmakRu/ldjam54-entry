/// @description Insert description here
// You can write your code in this editor

vspeed = 0
isFalling = false

var curr_x = x
var curr_y = y

x = -1000
y = -1000

while place_meeting(curr_x, curr_y,obj_abstract_collision) {
	curr_y -= 1
}

x = curr_x
y = curr_y

obj_logic_controller.number_in_order--


