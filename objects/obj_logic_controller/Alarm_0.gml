/// @description Insert description here

var _blocks= [obj_block_L, obj_block_palka, obj_block_square]
var _select = floor(random_range(0, array_length(_blocks) - 1))

if (player_alive)
{
	if (number_in_order <= 3)
	{
		if (points_number <= 0)
		{
			exit;
		}
		var _chosen_point_index = floor(random_range(0, array_length(spawn_points)));
		while (used_points[_chosen_point_index])
		{
			_chosen_point_index = floor(random_range(0, array_length(spawn_points)));
		}
		points_number -= 1;
		used_points[_chosen_point_index] = true;
		instance_create_layer(spawn_points[_chosen_point_index].x, spawn_points[_chosen_point_index].y, "Instances", _blocks[_select])
		number_in_order += 1;
	}
	
	alarm[0] = block_spawn_time;
}


