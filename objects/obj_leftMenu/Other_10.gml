/// @description Insert description here
// You can write your code in this editor
switch (other.uiControlName) {
	case "x_lock_menu": 
		menuLock = !menuLock; 
		other.uiButtonState = menuLock ? 1 : 0;
		other.uiTextColor = menuLock ? c_gray : c_white;
		var lockText = menuLock ? "Menu Locked!" : "Menu Unlocked!";
		x_gui_update_textbox(lockText);
		break;
	case "x_save_game": x_gui_update_textbox("Game Saved!"); break;
	
	case "x_quit": {
		quitDiag = instance_create_layer(room_width/2 ,room_height/2, GUI.GUI_FRONT, ui_dialog);
		with quitDiag {
			x_gui_confirm_popup("Quit Game", "#Are you sure you want to quit?", GUI, "x_quit_game");
		}
	}
	
	case "x_options":
	
		
	
		 break;
	
	default: exit;
}

