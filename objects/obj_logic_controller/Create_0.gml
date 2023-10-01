/// @description Insert description here

global.camera_shift_direction = 1; // 1 is up, -1 is down
global.water_level = 2272;

global.score = 0;
obj_game.player_alive = true;

camera_moving = false;
camera_moving_progress = 0;
camera_initial_y = camera_get_view_y(view_camera[0]);

y = 10
number_in_order = 0
alarm[0] = block_spawn_time
player_alive = true

audio_play_sound(snd_main_theme, 0, true);
