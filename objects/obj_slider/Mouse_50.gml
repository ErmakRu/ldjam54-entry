/// @description Insert description here
// You can write your code in this editor

if (instance_position(mouse_x,mouse_y,obj_bar) or instance_position(mouse_x,mouse_y,obj_slider))
{ lock = true}
if(lock=true)
{
	x = mouse_x
	x = clamp(x, obj_slider.x, obj_slider.x+obj_slider.sprite_width)
	global.music_volume = (mouse_x - obj_slider.x)/obj_slider.sprite_width
	audio_master_gain(global.music_volume)
}




