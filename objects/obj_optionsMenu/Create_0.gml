/// @description Insert description here
// You can write your code in this editor
event_inherited();

//with optionsPanel {
class = ".ignore";
var sprPanel = ctb_load_subimage(spr_textbox_slice9_subimages, room_width*1/2, room_height*1/2);
uiPanelSprite = sprPanel;
sprite_index = sprPanel;
showMenu = false;

#region Easing
easing = ds_map_create();
easing[? "start"] = -room_height*1/2;
easing[? "dest"] = -room_height*1/2;
easing[? "duration"] = 60;
easing[? "time"] = 0;
#endregion
	
op_button = ds_map_create();
	
var btnLabels = ["Music", "SFX", "Fullscreen", "Close Options"];
var btnTypes = [ui_slider, ui_slider, ui_toggle, ui_button];

for (var i=0; i < array_length_1d(btnLabels); i++) {
	var label = btnLabels[i];
	
	if ds_map_exists(op_button, label) continue;
	
	op_button[? label] = instance_create_layer(x+sprite_width*1/2,y+sprite_height*.2*(i+1),GUI.GUI_FRONT,btnTypes[i]);

	with (op_button[? label]) {
		uiAnchor = other;
			
		var textLabel = string_replace(label," ","#");
		
		var controlLabel = "x_"+string_lower(string_replace(label," ","_"));
		show_debug_message("Event Control Name: "+controlLabel);
		uiControlName = controlLabel;
		
		btn_index = i;
		uiEventObject = GUI;
		
		show_debug_message("Event Object Name: "+object_get_name(other.object_index));
		
		
		#region Add Labels
		var _label = instance_create_layer(x+uiSetWidth*0,y-uiSetHeight,layer,ui_label);	
		with _label {
			uiAlign = fa_middle;
			uiAlignV = (other.object_index == ui_toggle ? fa_center : fa_top);
			uiTextValue = textLabel;
			uiTextColor = c_white;
			uiAnchor = other.uiAnchor;
		}
		#endregion
		#region Slider Setup
		if object_index == ui_slider {
			var _level = instance_create_layer(x+uiSetWidth+12,y,layer,ui_label);
			_level.uiTextColor = c_white;
			_level.uiAnchor = uiAnchor;
			uiUpdateLabel = _level;
			uiMin=1;
			uiMax=100;
			uiValue = uiMax; //TODO: Import from previous session
			uiInterval=1;
		}
		#endregion
		
		if object_index == ui_toggle {uiToggleOn = window_get_fullscreen();}
		
		
		x = other.x;
	}
}


