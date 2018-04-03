/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprPanel = ctb_load_subimage(spr_textbox_slice9_subimages, room_width*1/2, room_height*3/4);
uiPanelSprite = sprPanel;
sprite_index = sprPanel;
showMenu = false;

#region Easing
easing = ds_map_create();
easing[? "start"] = room_width*3/2;
easing[? "dest"] = room_width*1/4;
easing[? "duration"] = 60;
easing[? "time"] = 0;
#endregion

btnList = [];

titleLabel = instance_create_layer(x+sprite_width/2-100, y+24, layer, ui_label);
eventName = EVENT_NAME;

with titleLabel {uiSetWidth = 200; uiAlign = fa_center; uiTextValue = other.eventName; uiAnchor=other; uiTextColor = c_white;}

for (var i = 0; i < ds_list_size(EVENT_ACTIONS); i++) {
	
	btnList[i] = instance_create_layer(x+32+180*(i),y+sprite_height-60,layer,ui_button_ani);
	
	with btnList[i] {
		uiAnchor = other;
		uiSetWidth = 150;
		uiTextValue = EVENT_ACTIONS[|i];
		uiEventObject = obj_eventController;
		uiControlName = EVENT_ACTIONS[|i];
	}
	
}









