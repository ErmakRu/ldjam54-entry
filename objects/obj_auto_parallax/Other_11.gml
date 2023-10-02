/// @description On shift

cached_offset_y -= sprite_get_height(background_asset) + sprite_get_height(background_seam_asset);

var _channel = animcurve_get_channel(ac_camera, 0);
offset_y = cached_offset_y + global.camera_shift_direction * scroll_amount * animcurve_channel_evaluate(_channel, obj_logic_controller.camera_moving_progress);
