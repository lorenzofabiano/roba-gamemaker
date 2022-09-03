x = owner.x;
y = owner.y+10;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(oPlayer)) {
	if (oPlayer.x < x) image_yscale = -image_yscale;
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 300) {
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		countdown --;
		if (countdown <= 0) {
			countdown = countdownrate;
			if (!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false)) {
				
				audio_sound_pitch(snShoot,choose(0.95,1,1.05));
				audio_play_sound(snShoot,5,false);

				with (instance_create_layer(x,y,"Bullet",oEBullet)) {

					spd = 10;
					direction = other.image_angle + random_range(-2, 2);
					image_angle = direction;
				}
			}
		}
	}
}


