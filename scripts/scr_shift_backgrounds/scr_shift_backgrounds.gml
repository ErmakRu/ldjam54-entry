function scr_shift_backgrounds()
{
	for (var _i = array_length(global.bgs_list) - 1; _i > 0; _i--)
	{
		global.bgs_list[_i] = global.bgs_list[_i - 1];
	}
	
	global.bgs_list[0] = irandom_range(1, 3);
	
	//show_debug_message(string(global.bgs_list[0]) + " " + string(global.bgs_list[1]) + " " + string(global.bgs_list[2]) + " " + string(global.bgs_list[3]) + " " + string(global.bgs_list[4]));
	
	with (obj_auto_parallax)
	{
		event_user(1);
	}
	
	with (obj_decor_walls)
	{
		event_user(1);
	}
}