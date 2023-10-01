/// @description Insert description here

// Inherit the parent event
event_inherited();

if (obj_logic_controller.camera_moving)
{
	var _channel = animcurve_get_channel(ac_camera, 0);
	initial_y = cached_initial_y + global.camera_shift_direction * scroll_amount * animcurve_channel_evaluate(_channel, obj_logic_controller.camera_moving_progress);
}
