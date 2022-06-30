/// @description Insert description here

//Draw the object near the player 
x = oPlayer.x;
y = oPlayer.y+2;

//draw the object angle based on its starting position and the mouse coordinates
image_angle = point_direction(x,y,mouse_x,mouse_y);

