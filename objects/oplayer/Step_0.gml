/// @description movement engine


//set keys

//(check every frame if the key is held down)
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

//check if on this frame the key has been pressed (not held)
var key_jump = keyboard_check_pressed(vk_space);


//Gamepad implementation
//if a keyboard key is pressed, switch to keyboard controls
if (key_left) || (key_right) || (key_jump) {
	controller = 0;
}

//if a gamepad button is pressed or if
//analogs are moved, switch to gamepad controls

//get the absolute value of the left analog position and if it's higher
//than 0.2, enable gamepad controls
if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	//this system allows to get the analog values of key_left or key_right (0 to 1)
	//so, for example, when moving right for any amount of analog space,
	// the key_right value increases while the key_left remains 0 and viceversa.
	//The value is then multiplied by whe walkspeed and tadaaa, habemus
	//analog controls.
	
	//when moving the left analog towards the left relatively
	//to the neutral position, get the absolute value of the minimum
	//value between the analog placement and the neutral position. 
	//It can return between 0 and 1.
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	
	//when moving the left analog towards the right relatively
	//to the neutral position, get the maximum
	//value between the analog placement and the neutral position. 
	//It can return between 0 and 1.
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	controller = 1;
}

//gp_face1 is the A button, if you're wondering
if (gamepad_button_check_pressed(0,gp_face1)) {
	key_jump = 1;
	controller = 1;
}

//calculate movement and direction (either returns -1 to move left, 
// 0 to stand still or +1 to move right and multiplies it with the 
//  walkspeed value)  
hsp = (key_right - key_left) * walksp;

//every frame increase the vertical speed by 0.2 (grv value)
vsp = vsp + grv;

//for every frame in which there's no vertical collision, assume that 
// the player is airborne
airborne = 1

//jumping
if (canJump-- > 0) && (key_jump = 1 ) {
	vsp = vspJump;
	canJump = 0;
}

//calculate collisions


//Collisions

//if there's a collision with walls on the player's position
// plus hsp value of pixels ahead, completely stop player's movement.
//	But untill the player is not completely close to the wall, take his 
//	 movement speed and cut it in half for every frame untill he's 
//	 just moving at 0.1 pixels per frame, then stop the player's movement.
if (place_meeting(x+hsp,y,oWall)){
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x+hsp,y,oWall)) x += hsp;
	}
	
	hsp = 0;
}

x += hsp;

if (place_meeting(x,y+vsp,oWall)){
	if (vsp > 0) canJump = 5;
	while (abs(vsp) > 0.1) {
		vsp *= 0.5; 
		if (!place_meeting(x,y+vsp,oWall)) y += vsp;
	}
	
	vsp = 0;
	airborne = 0;
}

y += vsp;

//Animation

// if there's no collision below the player and therefore he's airborne,
if (!place_meeting(x,y+1,oWall)) {
	// draw his airborne sprite
	sprite_index = sPlayer_air;
	// don't animate it
	image_speed = 0;
	
	//if he's falling, use the second frame of his sprite, if he's jumping
	//use the first
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
 }
// if there's a collision below the player and therefore he's on the ground,
else {
	// start animating
	 image_speed = 1;
	 
	 //if the player is still, use the default idle sprite.
	 if (hsp == 0) {
		 sprite_index = sPlayer_id;
	 }
	 
	 //if the player is moving, use the run sprite animation
	 else {
		 sprite_index = sPlayer_run;
	 }
}

//Draw the player sprite according to the direction he's moving.
// Draw straight or reverse the object's current sprite when it's moving
//	on the ground.
if (hsp != 0) && (airborne = 0) image_xscale = sign(hsp);

