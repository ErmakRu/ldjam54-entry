/// @description Synchronize position to camera

if (bind_to_camera)
{
	y = initial_y + (camera_get_view_y(view_camera[0]) - obj_logic_controller.camera_initial_y);
}
