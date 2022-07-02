/// @description Size variables and mode setup

//get the length of the gui screen
w = display_get_gui_width();

//get the height of the gui screen
h = display_get_gui_height();

//divide it by a half so that we have the point where the 2 black 
//rectangles will close each other
h_half = h * 0.5;

//build an enumerator, every value represents an action that 
//makes the transition happen
enum TRANS_MODE {
	//don't play or stop playing the transition
	OFF,
	//get to the next room
	NEXT,
	//go to a specific room
	GOTO,
	//restart this room
	RESTART,
	//start the transition
	INTRO
}


mode = TRANS_MODE.INTRO;
percent = 1;
target = room;