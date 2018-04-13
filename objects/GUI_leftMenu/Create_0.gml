/// @description Insert description here
// You can write your code in this editor
// Set the textbox's background
event_inherited();

xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

#region Left Bar Area
//leftboxArea = [0,32,240,yy*13/16-32];
lb_easing = ds_map_create();
lb_easing[? "start"] = -140;
lb_easing[? "dest"] = -140;
lb_easing[? "duration"] = 60;
lb_easing[? "time"] = 0;
#endregion

var panelSpr = ctb_load_subimage( spr_textbox_slice9_subimages, room_width*1/12, room_height/2);
panelTab = ctb_load_subimage( spr_textbox_slice9_subimages, 40, room_height*1/4);
uiPanelSprite = panelSpr;
sprite_index = panelSpr;


fadeOut = false;
menuOpen = false;
menuLock = false;

//Create Menu Btns
lm_button = ds_map_create();

#region Lock Menu Btn
lm_button[? "Lock Menu"] = instance_create_layer(x+8,y+8,GUI.GUI_FRONT,ui_button_ani);
with lm_button[? "Lock Menu"] {
	uiAnchor = other;
	uiTextValue = "";
	uiButtonSprite = spr_lockIcon;
	uiSetWidth = sprite_get_width(uiButtonSprite);
	uiSetHeight = sprite_get_height(uiButtonSprite);
	y -= uiSetHeight/2;
	uiButtonSpriteDown = spr_unlockIcon;
	uiButtonState = 0;
	uiBackColor = c_white;
	uiHoverColor = c_black;
	uiEventObject = other;
	uiControlName = "x_lock_menu";
	class = ".bottom";
}
#endregion


var btnLabels = ["Quit", "Save Game", "Options", "Test Event", "Pause"];

for (var i=0; i < array_length_1d(btnLabels); i++) {
	var label = btnLabels[i];
	
	if ds_map_exists(lm_button, label) continue;
	
	lm_button[? label] = instance_create_layer(x+sprite_width/8,y+sprite_height-sprite_height*.15*(i+1),GUI.GUI_FRONT,ui_button_ani);

	with (lm_button[? label]) {
		uiAnchor = other;
		var textLabel = string_replace(label," ","#")
		uiTextValue = textLabel;
		//uiSetWidth = other.sprite_width*.75;
		//uiSetHeight = other.sprite_height*.1;
		btn_index = i;
		uiEventObject = other;
		
		var controlLabel = "x_"+string_lower(string_replace(label," ","_"));
		uiControlName = controlLabel;
	}
}




