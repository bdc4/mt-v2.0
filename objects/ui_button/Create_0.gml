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

uiAlignV= fa_middle;
uiButtonState = 0;  //0 = up, 1 = down
uiButtonSprite= -1;
uiSpriteIndex=0;
uiSpriteAlign=fa_center;
uiSpriteAlignV=fa_middle;
uiSpriteScale=1.0;
uiPressFlash=false;
uiPressColor=c_yellow;
uiDownColor=c_green;
uiShadowColor = c_gray;
uiFlashButton=false;
uiFlashCounter=0;
uiBackColor2 = 0;
uiAlign = fa_center;  //default text to enter
uiTextColor = c_white; //default button color
uiBackColor = c_navy;
uiBackColor2 = c_blue;
uiIsToggle = false;   
uiButtonGroup = 0;      //button group
uiButtonLocked=false;
uiEnforceFocus=true; //check if button was in focus on press
hasfocus = false;

drawpress = false;
inForm=true;


scr_gui_setdefaults();         //you should set your default properties in this script.




/* */
/*  */
