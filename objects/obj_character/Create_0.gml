/// @description Init Vars

// Player Vars
dynamic_jump_rate_v = 0;
dynamic_jump_rate_h = 0;
jump_buffer_count = jump_buffer;
wallhug_gravity_vspeed = gravity_vspeed * wallhug_gravity_vspeed_multiplier;
wallhug_gravity_rate = gravity_rate * wallhug_gravity_rate_multiplier;
facing = 1;
jumping = false;
dashing = false;
last_wall_jumped = noone;
current_jump_input_captured = false;
walljump_direction = 1;
has_double_jump = true;
gravity_multiplier = 1;
crawling = 1;
oxygen_meter = 100;
oxygen_sprite_offset = 16;
step_timer = 0;
wallhugging = false;

// Controls
control_left = ord("A");
control_right = ord("D");
control_up = ord("W");
control_down = ord("S");
control_jump = vk_space; // unused, event-controlled
//control_

// Alternate Controls
control_left_alt = vk_left;
control_right_alt = vk_right;
control_up_alt = vk_up;
control_down_alt = vk_down;