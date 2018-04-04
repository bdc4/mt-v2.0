/// @description Insert description here
// You can write your code in this editor

with other.uiAnchor {
	event_user(4);
	easing[? "dest"] = room_width*3/2;
	easing[? "start"] = room_width*1/2;
	easing[? "duration"] = 60;
	easing[? "time"] = 0;
}
	
switch (other.uiControlName) {
	
	case "Fight": case "Attack":
	x_gui_update_textbox("Battle Initiated!", true);
	break;
	
	case "Run":
	x_gui_update_textbox("Got away safely!", true);
	break;
	
	case "Talk":
	x_gui_update_textbox("Talk Initiated.", true);
	break;
	
	case "Ignore": 
	x_gui_update_textbox("How Rude!", true);
	break;
	
	case "OK":
	x_gui_update_textbox("Job Done.", true);
	break;
	
	case "Investigate":
	x_gui_update_textbox("That's when they started the investigation.", true);
	break;
}