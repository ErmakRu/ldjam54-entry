/// @description Insert description here

draw_self();

if (state)
{
	draw_sprite(spr_menu_ok, 0, x, y);
}

draw_set_font(fnt_menu);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(x - 1650, y, text);
