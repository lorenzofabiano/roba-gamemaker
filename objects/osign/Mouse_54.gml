/// @description Global = you can press it anywhere
//not only on the object

if(point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText)){
	with (instance_create_layer(x,y-64,"Text",oText)) {
		the_text = other.the_text;
		length = string_length(the_text);
	}
	with (oCamera) {
		follow = other.id;
	}
}
