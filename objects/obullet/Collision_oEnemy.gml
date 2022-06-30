//set the following values to the variable of the
//single instance of oEnemy that gets hit.
with (other) {
	hp-- ;
	flash = 3;
	hitfrom = other.direction;
}

//make the bullet disappear when colliding with enemy
instance_destroy();