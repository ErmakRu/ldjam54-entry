/// @description Insert description here

var _blocks = [obj_block_stick, obj_block_stone, obj_block_key, obj_block_chandelier]
var _select = floor(random_range(0, array_length(_blocks) - 1))

if (player_alive)
{
	if (number_in_order < 3)
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
		if (blocks_spawned % 15 !=0 || blocks_spawned == 0)
		{
			instance_create_layer(spawn_points[_chosen_point_index].x, spawn_points[_chosen_point_index].y, "Instances", _blocks[_select]);
		}
		else
		{
			instance_create_layer(spawn_points[_chosen_point_index].x, spawn_points[_chosen_point_index].y, "Instances", obj_block_shoe);
		}
		
		blocks_spawned += 1;
		number_in_order += 1;
	}
	
	alarm[0] = block_spawn_time;
}


