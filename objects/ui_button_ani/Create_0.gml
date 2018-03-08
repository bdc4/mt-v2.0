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
uiButtonSpriteDown = -1;
uiSpriteIndexDown=0;
uiSpriteAlign=fa_center;
uiSpriteAlignV=fa_middle;
uiSpriteScale=1.0;
uiPressFlash=false;
uiDownColor=c_green;
uiFlashButton=false;
uiFlashCounter=0;
uiBackColor2 = 0;
uiAlign = fa_center;  //default text to enter
uiTextColor = c_white; //default button color
uiBackColor = c_navy;
uiBackColor2 = c_blue;
uiShadowColor = c_gray;
uiIsToggle = false;   
uiButtonGroup = 0;      //button group
uiButtonLocked=false;
uiSpriteAngle=0;
uiEnforceFocus=true; //check if button was in focus on press
uiTextFixedX=-1;   //use this for text x postion relative to x;
uiTextFixedY=-1;
uiTextTrim=true;
uiDownOffset = 3;  //buttons to control offset when pressed;




drawpress = false;
hasfocus = false;
//animate stuffs
CurWobble=0;
CurPulse=1;
//CurFading=1;
CurSparkle=0;
uiTextFixed=false;
uiTouchKey=false;
inForm=true; //enable focus checking
uiCanHover=true;
uiBackScale=1;   //if drawing back, this is the scale factor...used for keyboard and such.


scr_gui_setdefaults();         //you should set your default properties in this script.


/* */
/*  */
