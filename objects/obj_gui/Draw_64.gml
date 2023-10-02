/// @description Insert description here

draw_set_font(fnt_score);

draw_set_halign(fa_left)
draw_set_valign(fa_middle)

var _score_str = (global.gamestate != "menu" && global.gamestate != "settings" ? "SCORE: " + string(global.score >= 0 ? floor(global.score) : 0) + "\n" : "") + (global.highscore > global.score ? "HIGHSCORE: " + string(floor(global.highscore)) : "");
draw_text(view_wport[0] - 300, 50, _score_str);
