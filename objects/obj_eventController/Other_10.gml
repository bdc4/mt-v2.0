/// @description Insert description here
// You can write your code in this editor

event_inherited();

switch (other.uiControlName) {
	
	case "Fight":
	x_gui_update_textbox("Battle Initiated!", true);
	with other.uiAnchor {
		event_user(4);
		easing[? "dest"] = room_width*3/2;
		easing[? "start"] = room_width*1/2;
		easing[? "duration"] = 60;
		easing[? "time"] = 0;
	}
	break;
	
	case "Run":
	x_gui_update_textbox("Got away safely!", true);
	with other.uiAnchor {
		event_user(4);
		easing[? "dest"] = room_width*3/2;
		easing[? "start"] = room_width*1/2;
		easing[? "duration"] = 60;
		easing[? "time"] = 0;
	}
	break;
	
	case "Talk":
	x_gui_update_textbox("Talk Initiated", true);
	with other.uiAnchor {
		event_user(4);
		easing[? "dest"] = room_width*3/2;
		easing[? "start"] = room_width*1/2;
		easing[? "duration"] = 60;
		easing[? "time"] = 0;
	}
	break;
	
	case "OK":
	x_gui_update_textbox("Job Done", true);
	with other.uiAnchor {
		event_user(4);
		easing[? "dest"] = room_width*3/2;
		easing[? "start"] = room_width*1/2;
		easing[? "duration"] = 60;
		easing[? "time"] = 0;
	}
	break;
	
}