/// @description Insert description here

draw_set_font(fnt_score);
var _score_str = (global.gamestate != "menu" && global.gamestate != "settings" ? "SCORE: " + string(global.score) + "\n" : "") + (global.highscore > global.score ? "HIGHSCORE: " + string(global.highscore) : "");
draw_text(view_wport[0] - 300, 50, _score_str);
