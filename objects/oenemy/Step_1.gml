//when enemy dies, create the instance oEnemy_dead on the same layer and
//destroy the enemy one
if (hp <= 0) {
	
	with (instance_create_layer(x,y,layer,oEnemy_dead)) {
		//set the angle to get launched via the oEnemy variable "hitfrom"
		direction = other.hitfrom;
		//and add vertical and horizontal velocity to it.
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) -5;
		//draw the enemy dead sprite towards the direction he gets launched
		if (sign(hsp) != 0)  image_xscale = sign(hsp);	
	}
	//
	with (mygun) instance_destroy();

	if (instance_exists(oPlayer)) {
		global.kills++;
		global.killsthisroom++;
		with (oGame) killtextscale = 1.5;
		
	}
	instance_destroy();
}

