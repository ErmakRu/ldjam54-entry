/// @description Event on camera shift

if (bind_to_camera)
{
	exit;
}

y += global.camera_shift_direction * obj_logic_controller.camera_window_height;
