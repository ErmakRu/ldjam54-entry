/// @description Insert description here

var _score_str = (global.gamestate != "menu" && global.gamestate != "settings" ? "Score: " + string(global.score) + "\n" : "") + (global.highscore > global.score ? "Highscore: " + string(global.highscore) : "");
draw_text(view_wport[0] - 250, 10, _score_str);
