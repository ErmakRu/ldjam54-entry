/// @description Insert description here

// Inherit the parent event
event_inherited();

if (obj_logic_controller.camera_moving)
{
	var _channel = animcurve_get_channel(ac_camera, 0);
	offset_y = cached_offset_y + global.camera_shift_direction * scroll_amount * animcurve_channel_evaluate(_channel, obj_logic_controller.camera_moving_progress);
}

if (!authority)
{
	exit;
}

if (lock_shift)
{
	exit;
}

if (offset_y >= sprite_get_height(background_asset) + sprite_get_height(background_seam_asset))
{
	lock_shift = true;
	alarm_set(0, 100);
	scr_shift_backgrounds();
}
