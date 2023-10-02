/// @description Render player and control animations

if (jumping)
{
	var _frame = 0
	if (abs(vspeed) < 3)
	{
		_frame = 1;
	}
	else if (vspeed > 0)
	{
		_frame = 2;
	}
	draw_sprite(sprite_index, _frame, x, y);
}
else
{
	draw_self();
}
