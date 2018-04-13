/// @description Insert description here
// You can write your code in this editor
event_inherited();

class = ".ignore";
var sprPanel = ctb_load_subimage(spr_textbox_slice9_subimages, room_width*1/4, room_height*1/2);
uiPanelSprite = sprPanel;
sprite_index = sprPanel;
showMenu = false;
titleLabel = instance_create_layer(x+sprite_width/4, y+36, layer,ui_label);
with titleLabel {uiAlign = fa_right; uiTextValue = "Options Menu"; uiAnchor=other; uiSetWidth = 200; uiTextColor = c_white;}
#region Easing
easing = ds_map_create();
easing[? "start"] = -room_height*1/2;
easing[? "dest"] = -room_height*1/2;
easing[? "duration"] = 60;
easing[? "time"] = 0;
#endregion
	
op_button = ds_map_create();
	
var btnLabels = ["Music", "SFX", "Mute All", "Large Font", "Close Options"];
var btnTypes = [ui_slider, ui_slider, ui_toggle, ui_toggle, ui_button];
var exList = [3];
//exclude defined elements
for (var i=0; i < array_length_1d(btnLabels); i++) {
	
	var label = btnLabels[i];
	if label == "Large Font" continue;
	
	
	if ds_map_exists(op_button, label) continue;
	var yy = i != 0 ? y+90*(i+1) : y+90;
	op_button[? label] = instance_create_layer(x+sprite_width*1/3, yy, GUI.GUI_FRONT,btnTypes[i]);

	with (op_button[? label]) {
		
		uiAnchor = other;
		var textLabel = string_replace(label," "," ");
		var controlLabel = "x_"+string_lower(string_replace(label," ","_"));
		uiControlName = controlLabel;
		btn_index = i;
		uiEventObject = GUI;
		//show_debug_message("Event Control Name: "+controlLabel);
		//show_debug_message("Event Object Name: "+object_get_name(other.object_index));
		
		#region Slider Setup
		if object_index == ui_slider {
			uiSetWidth = uiSetWidth*2;
			var _level = instance_create_layer(x+uiSetWidth+12,y,layer,ui_label);
			_level.uiTextColor = c_white;
			_level.uiAnchor = uiAnchor;
			uiUpdateLabel = _level;
			uiMin=0;
			uiMax=100;
			if label == "Music"
				uiValue = !is_undefined(GUI.MUSIC_VOL) ? GUI.MUSIC_VOL : uiMax; //TODO: Import from previous session
			if label == "SFX"
				uiValue = !is_undefined(GUI.SFX_VOL) ? GUI.SFX_VOL : uiMax; //TODO: Import from previous session
			uiInterval=1;
			uiSliderUnits = "%";
		}
		#endregion
		
		#region Add Labels
		if object_index != ui_button {
			var _label = instance_create_layer(other.x+32,y,layer,ui_label);	
			with _label {
				uiAlign = fa_left;
				uiAlignV = (other.object_index == ui_toggle ? fa_top : fa_top);
				uiTextValue = textLabel;
				uiTextColor = c_white;
				uiAnchor = other.uiAnchor;
			}
		}
		#endregion
		
		muteAll = !is_undefined(GUI.MUTE_ALL) ? GUI.MUTE_ALL : false; //TODO: Import from previous session
		fontLarge = false; //TODO: Import from previous session
		if label == "Mute All" {uiToggleOn = muteAll;}
		if label == "Large Font" {uiToggleOn = fontLarge;}
		
		#region Close Options Button
		if object_index == ui_button {
			uiBackColor = c_white;
			uiDrawOutline = false;
			uiDrawBackColor = true;
			uiTextValue = textLabel;
			uiTextColor = c_black;
			uiAlign = fa_center;
			uiDrawSquare = true;
			uiSetWidth = string_width(uiTextValue)*1.5;
			uiSetHeight = string_height(uiTextValue)*1.5;
		}
		#endregion
		
		//x = other.x;
	}
}


