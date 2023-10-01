/// @description Update camera pos

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
