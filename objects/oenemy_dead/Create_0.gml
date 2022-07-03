hsp = 0; 
vsp = 0;
grv = 0.3;
done = 0; //check if the dead enemy is in the air or if it's fallen

//shake the camera when you kill an enemy
ScreenShake(3,20)
//dont animate this instance's sprite
image_speed = 0;
audio_play_sound(snDeath,10,false);


