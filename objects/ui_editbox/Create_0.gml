/*
Copyright (c) 2016 NailBuster Software Inc. (david@nailbuster.com). All rights reserved.



This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


*/

event_inherited();
uiInLineEditing=true;
uiGetNumber=false;
uiTextLimit=999;
uiTextColor=c_black;
uiFocusColor=c_gray;
uiFocusTextColor=c_white;
uiLabelTextColor=c_white;
uiCursorColor=c_white;
uiCursorWidth=6;
uiPopupKeyboard=true;
uiPopupOnly=false; //only accept keys from popup keyboard (limit characters);
curCursorPulse=1;
curCursorSpeed=0.05;
max_dispchars=0;
repeat_delay = 12;
repeat_last = 0;


inForm=true;
cursor_pos = -1;
start_pos = 0;
set_mouse_pos = -1;  //used on mouse event to set cursor.
keyboard_lasttab=false;  //workaround
keyboard_press="";  // from keyboard

keyboard_string=""; //reset keyboard buffer... 


scr_gui_setdefaults();         //you should set your default properties in this script.




/* */
/*  */
