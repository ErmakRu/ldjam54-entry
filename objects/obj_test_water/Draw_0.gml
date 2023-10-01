/// @description Insert description here

if (!surface_exists(distortion_surf))
{
    distortion_surf = surface_create(s_width, s_height);
}

surface_set_target(distortion_surf);

shader_set(sh_water);

shader_set_uniform_f(shader_time, current_time);

var _inv_draw_size = s_height * (y - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);

draw_surface_part(application_surface, 0, _inv_draw_size, s_width, s_height - _inv_draw_size, 0, 0);

shader_reset();

surface_reset_target();

var _scale_down = camera_get_view_height(view_camera[0]) / view_hport[0];
draw_surface_part_ext(distortion_surf, 0, 0, s_width, s_height, 0, y, _scale_down, _scale_down, c_white, 1);

draw_self();
