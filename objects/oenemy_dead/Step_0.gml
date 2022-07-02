if (done == 0) {
	vsp = vsp + grv;

	if (place_meeting(x+hsp,y,oWall)){
		while (abs(hsp) > 0.1) {
			hsp *= 0.5;
			if (!place_meeting(x+hsp,y,oWall)) x += hsp;
		}
	
		hsp = 0;
	}

	x += hsp;

	if (place_meeting(x,y+vsp,oWall)){
		
		if (vsp > 0) {
			//when it's fallen on the ground, set his sprite to the
			//second frame.
			done = 1;
			image_index = 1;
			ScreenShake(1.5,15);
		}
		
		while (abs(vsp) > 0.1) {
			vsp *= 0.5; 
			if (!place_meeting(x,y+vsp,oWall)) y += vsp;
		}
	
		vsp = 0;
		airborne = 0;
	}

	y += vsp;
}

