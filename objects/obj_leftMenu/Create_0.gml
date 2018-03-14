/// @description Insert description here
// You can write your code in this editor
// Set the textbox's background

xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

#region Left Bar Area
leftboxArea = [-60,32,120,yy*13/16-32];
lb_easing = ds_map_create();
lb_easing[? "start"] = -120;
lb_easing[? "dest"] = -100;
lb_easing[? "duration"] = 60;
lb_easing[? "time"] = 0;
#endregion

sprite_index = ctb_load_subimage( spr_textbox_slice9_subimages, leftboxArea[2], leftboxArea[3]-leftboxArea[1]);
fadeOut = false;
menuOpen = false;
menuLock = false;

//Create Menu Btns
lm_button = ds_map_create();
var btnLabels = ["Lock Menu", "Save Game", "Options"];

for (var i=0; i < array_length_1d(btnLabels); i++) {
	var label = btnLabels[i];
	lm_button[? label] = instance_create_layer(x,y+sprite_height-sprite_height*.15*(i+1),GUI.GUI_FRONT,ui_button_ani);

	with (lm_button[? label]) {
		var textLabel = string_replace(label," ","#")
		uiTextValue = textLabel;
		uiSetWidth = other.sprite_width*.75;
		uiSetHeight = other.sprite_height*.1;
		btn_index = i;
		uiEventObject = other;
		
		var controlLabel = "x_"+string_lower(string_replace(label," ","_"));
		uiControlName = controlLabel;
		x = other.x;
	}
}