x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

if (place_meeting(x,y,oShootable)) {

	with (instance_place(x,y,oShootable)) {
		hp-- ;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x,y,(oWall))) && (image_index != 0) {

	while (place_meeting(x,y,oWall)) {
		
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_change(oHitspark,true);
	layer_add_instance("Tiles",id);
	depth += 1;
	
} 

