/// @description Insert description here
// You can write your code in this editor

if (number_in_order < 4) {
	x = (grid_width * 7) * number_in_order
}

move_snap(grid_width,grid_height)

number_in_order +=1

if (number_in_order > 3 && number_in_order<7) {
	grabbed = true
}

else if (number_in_order>6) {
	isFalling = true
	grabbed = false
	y +=grid_height * 4
}

alarm[0] = time
