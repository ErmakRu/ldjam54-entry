
/// @description Insert description here
// You can write your code in this editor
if (player_alive) {
	if (number_in_order<=3) {
		instance_create_layer(obj_player.x, y, "Instances", obj_block_palka)
		number_in_order+=1
	}

	alarm[0] = time
}