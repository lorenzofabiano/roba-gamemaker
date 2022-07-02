/// @description Update Camera

//update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position

x += (xTo - x) / 25;
y += (yTo - y) / 25;

//Don't let the camera see over the room confines
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screen shake
x += random_range(-shake_remain,shake_remain)
y += random_range(-shake_remain,shake_remain)
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));


//Update actual camera position
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (layer_exists("SavanaBack")) {
	layer_x("SavanaBack",x/2);	
}

if (layer_exists("SavanaFront")) {
	layer_x("SavanaFront",x/5);	
}