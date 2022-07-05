//when colliding with a wall, disappear.


if (place_meeting(x,y,oShootable)) {

	with (instance_place(x,y,oShootable)) {
		hp-- ;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x,y,oWall)) && (image_index != 0) instance_destroy();