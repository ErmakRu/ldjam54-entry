/// @description Control Player

if (global.is_paused)
{
	exit;
}

if (!obj_game.player_alive)
{
	exit;
}

step_timer += delta_time * step_freq;

if (!obj_logic_controller.camera_moving)
{
	var _camera_margin = (camera_get_view_height(view_camera[0]) - obj_logic_controller.camera_window_height) / 2;
	if (y < camera_get_view_y(view_camera[0]) + _camera_margin)
	{
		global.camera_shift_direction = 1;
		scr_trigger_user_event_0();
	}
	else if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - _camera_margin && (obj_floor.y - y > camera_get_view_y(view_camera[0]) / 2))
	{
		global.camera_shift_direction = -1;
		scr_trigger_user_event_0();
	}
}

if (global.water_level + 400 < bbox_top)
{
	oxygen_meter -= delta_time * oxygen_decrease_rate;
	if (oxygen_meter <= 0)
	{
		audio_play_sound(snd_drowning, 0, false, global.sound_volume / 100.0);
		scr_die();
	}
}
else
{
	oxygen_meter = 100;
}
	
if (dashing)
{
	hspeed = 1 * facing * dash_rate;
	if (!place_meeting(x + hspeed, y, obj_abstract_collision))
	{
		exit;
	}
}

if (crawling)
{
	if (!place_meeting(x, y - 1, obj_abstract_collision))
	{
		crawling = false;
		if (facing < 0)
		{
			sprite_index = spr_character_idle_left;
		}
		else
		{
			sprite_index = spr_character_idle_right;
		}
	}
}

// Get input
var _move_input_total = 0;
if (keyboard_check(control_left) || keyboard_check(control_left_alt)) { _move_input_total -= 1; }
if (keyboard_check(control_right) || keyboard_check(control_right_alt)) { _move_input_total += 1; }
// Check / increment jump buffer
if (jump_buffer_count < jump_buffer)
{
   jump_buffer_count++;
}

// Water resets things
if (place_meeting(x, y + 1, obj_abstract_water))
{
	has_double_jump = true;
	gravity_multiplier = 1;
}

// No move input, brake
// On ground
if (place_meeting(x, y + 1, obj_abstract_collision))
{
	jumping = false;
	var _floor = instance_place(x, y + 1, obj_abstract_collision);
	if (_floor != last_wall_jumped)
	{
		last_wall_jumped = noone;
	}
	has_double_jump = true;
	gravity_multiplier = 1;
	if ((_move_input_total == 0) || (hspeed * _move_input_total < 0))
	{
		hspeed -= hspeed * brake_rate_ground * (1 - dashing);
	}
}
// In air
if !(place_meeting(x, y + 1, obj_abstract_collision))
{
   if ((_move_input_total == 0) || (hspeed * _move_input_total < 0))
   {
       hspeed -= hspeed * brake_rate_air;
   }
}

// Move player and clamp value to max
// On ground
if (place_meeting(x, y + 1, obj_abstract_collision))
{
   hspeed += _move_input_total * accel_rate_ground * (1 - crawling / 2);
   jumping = false;
   if (abs(hspeed) > 2)
	{
		if (hspeed > 0)
		{
			sprite_index = spr_character_walk_right;
		}
		else
		{
			sprite_index = spr_character_walk_left;
		}
		if (step_timer >= 1)
		{
			scr_play_step();
			step_timer = 0;
		}
	}
	else
	{
		if (facing < 0)
		{
			sprite_index = spr_character_idle_left;
		}
		else
		{
			sprite_index = spr_character_idle_right;
		}
	}
}
	   
// In air
if !(place_meeting(x, y + 1, obj_abstract_collision)) && (_move_input_total * dynamic_jump_rate_h >= 0)
{
   hspeed += _move_input_total * accel_rate_air;
   jumping = true;
}
// Limit speed to move_rate
hspeed = clamp(hspeed, -move_rate * (1 - crawling / 2), move_rate * (1 - crawling / 2));

// Gravity
// Check water
if (place_meeting(x, y, obj_abstract_water))
{
	var _water_inst = instance_place(x, y, obj_abstract_water);
	vspeed += gravity_rate / 2 - water_up_rate * (bbox_bottom - _water_inst.bbox_top);
	audio_stop_sound(snd_wall_sliding);
	if (!audio_is_playing(snd_dalling_and_jumping_in_water))
	{
		audio_play_sound(snd_dalling_and_jumping_in_water, 0, true, global.sound_volume / 100.0);
	}
	wallhugging = false;
}
else if (place_meeting(x + sign(_move_input_total), y, obj_abstract_collision)) // Check wall hugging
{
	if (facing > 0)
	{
		sprite_index = spr_character_slip_right;
	}
	else
	{
		sprite_index = spr_character_slip_left;
	}
	gravity_multiplier = 1;
	if ((vspeed < 0) && !place_meeting(x, y + 1, obj_abstract_collision))
	{
	   vspeed += gravity_rate;
	}
	else if ((vspeed < wallhug_gravity_vspeed) && !place_meeting(x, y + 1, obj_abstract_collision))
	{
	   vspeed += wallhug_gravity_rate;
	}
	vspeed = clamp(vspeed, -10000, wallhug_gravity_vspeed);
	audio_stop_sound(snd_dalling_and_jumping_in_water);
	if (!audio_is_playing(snd_wall_sliding))
	{
		audio_play_sound(snd_wall_sliding, 0, true, global.sound_volume / 100.0);
	}
	wallhugging = true;
}
else
{
	audio_stop_sound(snd_wall_sliding);
	audio_stop_sound(snd_dalling_and_jumping_in_water);
	if ((vspeed < gravity_vspeed) && !place_meeting(x, y + 1, obj_abstract_collision))
	{
	   vspeed += gravity_rate * gravity_multiplier;
	}
	wallhugging = false;
}

if (dynamic_jump_rate_h > 0)
{
	dynamic_jump_rate_h = clamp(dynamic_jump_rate_h - jump_h_falloff_rate, 0, jump_rate);
}
if (dynamic_jump_rate_v > 0)
{
	dynamic_jump_rate_v = clamp(dynamic_jump_rate_v - jump_v_falloff_rate, 0, jump_rate);
}

// Higher jump when longer press
vspeed += 1 * -dynamic_jump_rate_v;
hspeed += walljump_direction * dynamic_jump_rate_h;

// Jump if on / close to ground
// Account for ledge buffer but prevent wall jumping
if (!current_jump_input_captured) && ((place_meeting(x + jump_ledge_buffer, y + 1, obj_abstract_collision) || place_meeting(x + jump_ledge_buffer, y + 1, obj_abstract_water)) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_abstract_collision)) ||
   ((place_meeting(x - jump_ledge_buffer, y + 1, obj_abstract_collision) || place_meeting(x - jump_ledge_buffer, y + 1, obj_abstract_water)) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_abstract_collision))
{
   /*if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);*/
   vspeed = 1 * -jump_rate;
   dynamic_jump_rate_v = jump_rate * extra_jump_rate_v;
   current_jump_input_captured = true;
}
else if (!current_jump_input_captured) && (place_meeting(x + 1, y, obj_abstract_collision) && jump_buffer_count < jump_buffer) // wall jump
{
	var _wall_inst = instance_place(x + 1, y, obj_abstract_collision);
	if (_wall_inst != last_wall_jumped)
	{
		vspeed = 1 * -jump_rate;
		dynamic_jump_rate_v = jump_rate * extra_jump_rate_v;
		walljump_direction = -1;
		hspeed = 1 * h_walljump_rate * walljump_direction;
		dynamic_jump_rate_h = h_walljump_rate * extra_jump_rate_h;
		last_wall_jumped = _wall_inst;
		current_jump_input_captured = true;
	}
}
else if (!current_jump_input_captured) && (place_meeting(x - 1, y, obj_abstract_collision) && jump_buffer_count < jump_buffer) // wall jump
{
	var _wall_inst = instance_place(x - 1, y, obj_abstract_collision);
	if (_wall_inst != last_wall_jumped)
	{
		vspeed = 1 * -jump_rate;
		dynamic_jump_rate_v = jump_rate * extra_jump_rate_v;
		walljump_direction = 1;
		hspeed = 1 * h_walljump_rate * walljump_direction;
		dynamic_jump_rate_h = h_walljump_rate * extra_jump_rate_h;
		last_wall_jumped = _wall_inst;
		current_jump_input_captured = true;
	}
}
else if (!current_jump_input_captured) && has_double_jump && jump_buffer_count < jump_buffer
{
	vspeed = 1 * -double_jump_rate;
	current_jump_input_captured = true;
	has_double_jump = false;
}

// Collisions and stuck/overlap prevention
if (place_meeting(x + hspeed, y, obj_abstract_collision)) {
   while (!place_meeting(x + sign(hspeed), y, obj_abstract_collision)) {
       x += sign(hspeed);
   }
   hspeed = 0;
}
if (place_meeting(x, y + vspeed, obj_abstract_collision)) {
   while (!place_meeting(x, y + sign(vspeed), obj_abstract_collision)) {
       y += sign(vspeed);
   }
   
   vspeed = 0;
   
   if (!place_meeting(x, y, obj_abstract_block))
   {
	scr_play_land();
   }
}

// Diagonal
if (place_meeting(x + hspeed, y + vspeed, obj_abstract_collision)) {
   while (!place_meeting(x + sign(hspeed), y + sign(vspeed), obj_abstract_collision)) {
       x += sign(hspeed);
       y += sign(vspeed);
   }
   hspeed = 0;
   vspeed = 0;
}

if (hspeed != 0)
	facing = sign(hspeed);
else
{
	if (_move_input_total != 0)
		facing = sign(_move_input_total)
	else
		facing = 1;
}

if (jumping && !wallhugging)
{
	if (facing < 0)
	{
		sprite_index = spr_character_jump_right;
	}
	else
	{
		sprite_index = spr_character_jump_left;
	}
}

if (crawling)
{
	if (facing < 0)
	{
		sprite_index = spr_character_crawl_right;
	}
	else
	{
		sprite_index = spr_character_crawl_left;
	}
}

global.score += -1 * vspeed * delta_time / 100000;
if (global.score > global.highscore)
{
	global.highscore = global.score;
}
