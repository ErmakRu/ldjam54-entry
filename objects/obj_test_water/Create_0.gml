/// @description Insert description here

// Inherit the parent event
event_inherited();

shader_time = shader_get_uniform(sh_water, "time");

s_width = surface_get_width(application_surface);
s_height = surface_get_height(application_surface);

distortion_surf = surface_create(s_width, s_height);
