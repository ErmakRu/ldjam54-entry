/// @description Insert description here

global.camera_shift_direction = 1; // 1 is up, -1 is down
global.water_level = obj_abstract_water.y;

global.score = 0;
obj_game.player_alive = true;

camera_moving = false;
camera_moving_progress = 0;
camera_initial_y = camera_get_view_y(view_camera[0]);

number_in_order = 0
alarm[0] = block_spawn_time
player_alive = true

water_accel_progress = 0;

audio_play_sound(snd_main_theme, 0, true);

points_number = instance_number(obj_block_spawn_point);
spawn_points = [];
used_points = [];

controlled_block_set = false;

for (var _i = points_number - 1; _i >= 0; _i--)
{
	spawn_points[_i] = instance_find(obj_block_spawn_point, _i);
	used_points[_i] = false;
}
