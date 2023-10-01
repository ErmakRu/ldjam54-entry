/// @description Insert description here
// You can write your code in this editor
var blocks= [obj_block_L, obj_block_palka, obj_block_square]
var select = floor(random_range(0,3))

if (player_alive) {
	if (number_in_order<=3) {
		instance_create_layer(clamp(obj_character.x, block_spawn_window_margin, room_width - block_spawn_window_margin), y - 200, "Instances", blocks[select])
		number_in_order+=1
	}

	alarm[0] = block_spawn_time
}


