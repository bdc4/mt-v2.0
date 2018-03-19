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
   
   /*
   case "x_fullscreen":
   #region Toggle Fullscreen
	with GUI {
		x_gui_update_textbox("toggle pressed");
		if !windowFS {
		    window_set_size(windowXMax,windowYMax);
			windowFS = true;
		} else { 
			window_set_size(windowXMin,windowYMin);
			windowFS = false;
		}
	}
	#endregion
	break;
	*/
	case "x_close_options":
	#region Close Options
	x_gui_update_textbox("Options Closed!");
	with (other.uiAnchor) {
		showMenu = false;
		easing[? "start"] = room_height*1/4;
		easing[? "dest"] = -room_height*1/2;
		easing[? "duration"] = 60;
		easing[? "time"] = 0;
	}
	#endregion
	break;
	default: exit;
}