/// @description Insert description here
// You can write your code in this editor
switch (other.uiControlName) {
	case "x_close_menu": x_gui_update_textbox("Menu closed!"); break;
	case "x_save_game": x_gui_update_textbox("Game Saved!"); break;
	case "x_options": x_gui_update_textbox("Options selected!"); break;
	default: exit;
}