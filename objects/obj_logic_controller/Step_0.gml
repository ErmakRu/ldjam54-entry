/// @description Update camera and water pos

if (points_number <= 0)
{
	points_number = array_length(spawn_points);
	for (var _i = points_number - 1; _i >= 0; _i--)
	{
		used_points[_i] = false;
	}
}

water_accel_progress = clamp(water_accel_progress + delta_time * water_rise_accel, 0, 1);
var _water_channel = animcurve_get_channel(ac_water_speed, 0);
global.water_level -= water_rise_speed * animcurve_channel_evaluate(_water_channel, water_accel_progress);

if (!camera_moving)
{
	exit;
}

camera_moving_progress += delta_time * camera_speed;
if (camera_moving_progress >= 1)
{
	camera_set_view_pos(view_camera[0], 0, camera_initial_y);
	camera_moving = false;
}
var _channel = animcurve_get_channel(camera_curve, 0);
var _new_pos = animcurve_channel_evaluate(_channel, camera_moving_progress)
camera_set_view_pos(view_camera[0], 0, camera_initial_y + camera_window_height * global.camera_shift_direction * (1 - _new_pos))
