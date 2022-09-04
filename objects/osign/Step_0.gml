/// @description Global = you can press it anywhere
//not only on the object

if (instance_exists(oPlayer)) && (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText)) {
	nearby = true;
	if (keyboard_check_pressed(ord("W"))) {	
		with (instance_create_layer(x,y-64,"Text",oText)) {
			the_text = other.the_text;
			length = string_length(the_text);
		}
		with (oCamera) {
			follow = other.id;
		}
	}
}
else nearby = false;