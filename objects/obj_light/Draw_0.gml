/// @description Insert description here

gpu_set_blendmode(bm_add);
var _light_channel = animcurve_get_channel(ac_light, 0);
var _frac = animcurve_channel_evaluate(_light_channel, obj_auto_parallax_1.offset_y / (sprite_get_height(obj_auto_parallax_1.background_asset) + sprite_get_height(obj_auto_parallax_1.background_seam_asset)));
draw_sprite_ext(sprite_index, global.bgs_list[1], x, y, 1, 1, 0, c_white, 1 - _frac);
draw_sprite_ext(sprite_index, global.bgs_list[2], x, y, 1, 1, 0, c_white, _frac);
gpu_set_blendmode(bm_normal);
