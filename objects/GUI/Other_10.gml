/// @description Insert description here
// You can write your code in this editor
switch (other.uiControlName) {
	
	case "x_quit_game":
		#region Quit Game Prompt
		{
	      with (other)  //work with dialog
	        {
	         switch uiDialogResult   
	            {        
	               case 1 : game_end(); break;
	               case 2 : show_debug_message("You Pressed Button 2"); break;
	               case -1: break;
	            }  
	         //to read contents of dialog
	         // show_message_async('Input Box 1 = >'+uiEditBox1.uiTextValue);
	         // show_message_async('Input Box 1 = >'+uiEditBox2.uiTextValue);
	         // if uiCheckBox.checked then show_message_async('CheckBox is Set!');                                             
	        }        
		}
		#endregion
	break;
	
	case "x_mute_all":
		if !other.muteAll {
			audio_group_set_gain(audiogroup_music, 0, 0);
			audio_group_set_gain(audiogroup_sfx, 0, 0);
			other.muteAll = true;
		}
		else {
			audio_group_set_gain(audiogroup_music, obj_optionsMenu.op_button[? "Music"].uiValue/100, 1);
			audio_group_set_gain(audiogroup_music, obj_optionsMenu.op_button[? "SFX"].uiValue/100, 1);
			other.muteAll = false;
		}
		GUI.MUTE_ALL = other.muteAll;
	break;
	
	case "x_music":
		audio_group_set_gain(audiogroup_music, obj_optionsMenu.op_button[? "Music"].uiValue/100, 1);
		GUI.MUSIC_VOL = obj_optionsMenu.op_button[? "Music"].uiValue;
	break;
	
	case "x_sfx":
		audio_group_set_gain(audiogroup_sfx, obj_optionsMenu.op_button[? "SFX"].uiValue/100, 1);
		if mouse_check_button_released(mb_left) {audio_play_sound(snd_gun,100,false);}
		GUI.SFX_VOL = obj_optionsMenu.op_button[? "SFX"].uiValue;
	break;
	
	case "x_large_font":
		other.fontLarge = !other.fontLarge;
		var bool = other.fontLarge;
		GUI.fontLarge = bool;
		GUI.tbFont = GUI.fonts[bool];
		with (ui_defaults) {
			uiFont = GUI.tbFont;
			var wScale = [180,360];
			var hScale = [30,60];
			uiSetWidth = wScale[GUI.fontLarge];
			uiSetHeight = hScale[GUI.fontLarge];
		}
	break;
	
	case "x_close_options":
		#region Close Options
		x_gui_update_textbox("Options Closed!");
		with (other.uiAnchor) {
			showMenu = false;
			easing[? "start"] = room_height*1/4;
			easing[? "dest"] = -room_height*1/2;
			easing[? "duration"] = 60;
			easing[? "time"] = 0;
			event_user(4);
		}
		#endregion
	break;
	default: exit;
}