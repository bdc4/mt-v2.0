/// @description Insert description here
// You can write your code in this editor
event_inherited();

switch (other.uiControlName) {
	
	case "x_lock_menu": 
		menuLock = !menuLock; 
		other.uiButtonState = menuLock ? 1 : 0;
		other.uiTextColor = menuLock ? c_gray : c_white;
		var lockText = menuLock ? "Menu Locked!" : "Menu Unlocked!";
		x_gui_update_alertbox(lockText);
	break;
	
	case "x_save_game":
		x_gui_update_alertbox("Game Saved!");
	break;
	
	case "x_quit": {
		quitDiag = instance_create_layer(room_width/2 ,room_height/2, GUI.GUI_FRONT, ui_dialog);
		with quitDiag {
			x_gui_confirm_popup("Quit Game", "#Are you sure you want to quit?", GUI, "x_quit_game");
		}
	}
	break;
	
	case "x_options":
		with (obj_optionsMenu) {
			if !showMenu {showMenu = true;} else continue;
			event_user(3);
			x_gui_update_alertbox("Menu Opened!");
			easing[? "start"] = -room_height*1/2;
			easing[? "dest"] = room_height*1/4;
			easing[? "duration"] = 60;
			easing[? "time"] = 0;
		}
	break;
	
	case "x_test_event":
		//Creates a random pop-up from the hard-coded data in the event controller object
		var rand = irandom_range(0, ds_map_size(EVENTS));
		rand = obj_eventController.eveNameList[rand];
		var event = EVENTS[? rand];
		//TODO: Add more events and trigger them from an in-game action
		
		x_gui_update_textbox("A random event has been triggered!", true);
		
		EVENT_NAME = event[? "name"];
		EVENT_ACTIONS = event[? "actions"];
		
		instance_create_layer(room_width,64,GUI.GUI_MID,obj_eventWindow);
		with (obj_eventWindow) {
			if !showMenu {showMenu = true;} else continue;
			event_user(3);
			x_gui_update_alertbox("Event triggered!");
			
		}
	
	default: exit;
}

