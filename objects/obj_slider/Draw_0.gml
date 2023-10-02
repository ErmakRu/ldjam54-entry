/// @description Insert description here

draw_self();

draw_sprite(spr_menu_slider, 0, x + lmargin + slider_pos * (sprite_width - rmargin - lmargin), y + 90);

draw_set_font(fnt_menu);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(x - 1000, y + 150, text);
