/// @description Insert description here

//Draw the object near the player 
x = oPlayer.x;
y = oPlayer.y+2;

//draw the object angle based on its starting position and the mouse coordinates
image_angle = point_direction(x,y,mouse_x,mouse_y);

recoil = max(0,recoil - 1);

if (mouse_check_button(mb_left)) && (firedelay-- < 0) {
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

if (mouse_x > x) image_yscale = 1; else image_yscale = -1;