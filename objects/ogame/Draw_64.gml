
/*if (instance_exists(oPlayer)) {
	draw_set_color(c_white);
	draw_set_font(fDefault);
	draw_text(100,50,"controller " + string(oPlayer.controller));
	draw_text(100,70,"airborne: " + string(oPlayer.airborne));
	draw_text(100,90,"hascontrol: " + string(oPlayer.hascontrol));
}*/

if (room != rMenu) && (instance_exists(oPlayer)) && (global.kills > 0) {
	killtextscale = max(killtextscale * 0.95, 1);
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(600,12,string(global.kills) + " Kills", killtextscale, killtextscale, 0);
	draw_set_colour(c_white);
	draw_text_transformed(600,10,string(global.kills) + " Kills", killtextscale, killtextscale, 0);
}


