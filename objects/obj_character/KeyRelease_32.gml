/// @description Stop jump

gravity_multiplier = 1 + dynamic_jump_rate_v / (jump_rate * extra_jump_rate_v);

dynamic_jump_rate_v = 0;
dynamic_jump_rate_h = 0;
