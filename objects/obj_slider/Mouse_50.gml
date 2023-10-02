/// @description Insert description here
// You can write your code in this editor

if (instance_position(mouse_x,mouse_y,obj_bar) or instance_position(mouse_x,mouse_y,obj_slider))
{ lock = true}
if(lock=true)
{
	x = mouse_x
	x = clamp(x, obj_bar.x, obj_bar.x+obj_bar.sprite_width)
	global.music_volume = ((x - obj_bar.x)/obj_bar.sprite_width) *100
}




