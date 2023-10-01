/// @description Insert description here

global.camera_shift_direction = 1; // 1 is up, -1 is down

camera_moving = false;
camera_moving_progress = 0;
camera_initial_y = camera_get_view_y(view_camera[0]);
