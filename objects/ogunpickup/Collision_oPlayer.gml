/// @description Equip
instance_create_layer(oPlayer.x,oPlayer.y,"Gun",oGun);
audio_play_sound(snPickup,5,false);
instance_destroy();


