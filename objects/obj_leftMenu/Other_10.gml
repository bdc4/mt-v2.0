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
	case "x_options": x_gui_update_textbox("Options selected!"); break;
	default: exit;
}