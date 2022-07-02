/// @description Debug features
//Restart the game by pressing R or Y on gamepad
if (keyboard_check_pressed(ord("R"))) || (gamepad_button_check(0,gp_face4))
{
 SlideTransition(TRANS_MODE.RESTART);
}


if keyboard_check_pressed(vk_numpad1) SlideTransition(TRANS_MODE.GOTO,rRoom1);
if keyboard_check_pressed(vk_numpad2) SlideTransition(TRANS_MODE.GOTO,rRoom2);
if keyboard_check_pressed(vk_numpad3) SlideTransition(TRANS_MODE.GOTO,rRoom3);

