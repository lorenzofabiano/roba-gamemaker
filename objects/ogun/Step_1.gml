/// @description Insert description here

//Draw the object near the player 
x = oPlayer.x;
y = oPlayer.y+2;

//draw the object angle based on its starting position and the mouse coordinates
if (oPlayer.controller == 0) {	
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else {
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2) {
		controllerangle = point_direction(0,0,controllerh,controllerv)
	}
	
	image_angle = controllerangle;
}	



recoil = max(0,recoil - 1);

if ((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb))) && (firedelay-- < 0) {
	recoil = 4;
	firedelay = 5;
	with (instance_create_layer(x,y,"Bullet",oBullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1
} else image_yscale = 1;