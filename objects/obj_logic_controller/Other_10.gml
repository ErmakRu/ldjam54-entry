/// @description Insert description here

global.water_level += global.camera_shift_direction * obj_logic_controller.camera_window_height;

camera_moving = true;
camera_moving_progress = 0;
camera_set_view_pos(view_camera[0], 0, camera_initial_y + camera_window_height * global.camera_shift_direction)
