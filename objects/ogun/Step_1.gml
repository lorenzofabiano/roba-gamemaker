/// @description Insert description here

//Draw the object near the player 
x = oPlayer.x;
y = oPlayer.y+2;

//check if gamepad is enabled and used. If not, 
//draw the object angle based on its starting position 
//and mouse coordinates.
if (oPlayer.controller == 0) {	
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
//Otherwise, get the right analog x and y coordinates and
//turn them into an angle value to apply to the gun sprite.
else {
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2) {
		controllerangle = point_direction(0,0,controllerh,controllerv)
	}
	
	image_angle = controllerangle;
}	


//Store the maximum value between 0 and "recoil - 1" (this will decrease
//the recoil value every frame but won't let it slide below 0)
recoil = max(0,recoil - 1);

//if pressing LMB or RT on xinput gamepad will shoot. Decrease the firedelay
//value every time the check is made.
if ((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb))) && (firedelay-- < 0) {
	//the higher, the more the gun moves backwards.
	recoil = 4;
	//the higher, the lower is the fire ratio
	firedelay = 5;
	//create the bullet in the Bullet's room layer and apply the following
	//values to it's instance
	audio_sound_pitch(snShoot,choose(0.95,1,1.05));
	audio_play_sound(snShoot,5,false);
	with (instance_create_layer(x,y,"Bullet",oBullet)) {
		//number of pixels traveling per frame
		spd = 25;
		//the direction to which the bullets moves. Other refers to 
		//the object that referenced this instance, therefore oGun.
		direction = other.image_angle + random_range(-2, 2);
		//the angle to draw the bullet's sprite at
		image_angle = direction;
	}
}

//get the coordinates where the gun would recoil if shooting in any
//direction
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

//when the gun is pointed in the right half of the screen, draw it straight
//when not, flip it vertically
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1
} else image_yscale = 1;