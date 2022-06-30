/// @description Basic vars

vsp = 0; //current vertical velocity
grv = 0.2; //fall acceleration
walksp = 3; // potential horizontal speed 
hsp = irandom_range(-walksp,walksp) ; //current horizontal velocity
vspJump = -6; // potential jump speed
canJump = 0; //checks if player can jump
airborne = 0; //check if player is airborne 0 = not 1 = yes

hp = 5;
flash = 0;
hitfrom = 0;

