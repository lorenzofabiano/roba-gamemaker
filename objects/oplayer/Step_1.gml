/// @description Debug features
//Restart the game by pressing R or Y on gamepad
if (keyboard_check_pressed(ord("R"))) || (gamepad_button_check(0,gp_face4))
{
 SlideTransition(TRANS_MODE.RESTART);
}




