/// @description Draw black bars

if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
	
//	draw_sprite_ext(sKastro,0,w/2,h/2,5,5,percent*3600,c_white,percent);
	
}
