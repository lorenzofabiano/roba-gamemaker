/// @description 
with (oGun) instance_destroy();
instance_change(oPlayer_dead,true);

direction = point_direction(other.x,other.y,x,y);
hsp = lengthdir_x(4,direction);
vsp = lengthdir_y(4,direction)-2;

if (sign(hsp) != 0) image_xscale = sign(hsp); 

