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
x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Update actual camera position
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);