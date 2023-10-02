/// @description Insert description here

var _init_point_y = y - 2 * (sprite_get_height(background_asset) + sprite_get_height(background_seam_asset))

for (var _i = 0; _i < array_length(global.bgs_list) - 1; _i++)
{
	draw_sprite(background_asset, global.bgs_list[_i], x, _init_point_y + offset_y + _i * (sprite_get_height(background_asset) + sprite_get_height(background_seam_asset)));
	draw_sprite(background_seam_asset, global.bgs_list[_i] + 4 * global.bgs_list[_i + 1], x, _init_point_y + offset_y + _i * (sprite_get_height(background_asset) + sprite_get_height(background_seam_asset)) + sprite_get_height(background_asset));
}

