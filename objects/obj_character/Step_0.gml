/// @description Control Player

if (global.is_paused)
{
	exit;
}

if (!obj_logic_controller.camera_moving)
{
	var _camera_margin = (camera_get_view_height(view_camera[0]) - obj_logic_controller.camera_window_height) / 2;
	if (y < camera_get_view_y(view_camera[0]) + _camera_margin)
	{
		global.camera_shift_direction = 1;
		scr_trigger_user_event_0();
	}
	else if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - _camera_margin)
	{
		global.camera_shift_direction = -1;
		scr_trigger_user_event_0();
	}
}

if (global.water_level < bbox_top)
{
	oxygen_meter -= delta_time * oxygen_decrease_rate;
	if (oxygen_meter <= 0)
	{
		obj_game.player_alive = false
        instance_destroy()
		obj_logic_controller.alarm[1] = 20
	}
}
else
{
	oxygen_meter = 100;
}
	
if (dashing)
{
	hspeed = 1 * facing * dash_rate;
	exit;
}

if (crawling)
{
	if (!place_meeting(x, y - 1, obj_abstract_collision))
	{
		crawling = false;
		sprite_index = spr_character_idle;
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
	last_wall_jumped = noone;
	has_double_jump = true;
	gravity_multiplier = 1;
}

// No move input, brake
// On ground
if (place_meeting(x, y + 1, obj_abstract_collision))
{
	last_wall_jumped = noone;
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
}
else if (place_meeting(x + sign(_move_input_total), y, obj_abstract_collision)) // Check wall hugging
{
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
}
else
{
	if ((vspeed < gravity_vspeed) && !place_meeting(x, y + 1, obj_abstract_collision))
	{
	   vspeed += gravity_rate * gravity_multiplier;
	}
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
else if (!current_jump_input_captured) && (place_meeting(x + sign(_move_input_total), y, obj_abstract_collision) && jump_buffer_count < jump_buffer) // wall jump
{
	var _wall_inst = instance_place(x + sign(_move_input_total), y, obj_abstract_collision);
	if (_wall_inst != last_wall_jumped)
	{
		vspeed = 1 * -jump_rate;
		dynamic_jump_rate_v = jump_rate * extra_jump_rate_v;
		walljump_direction = -sign(_move_input_total);
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
