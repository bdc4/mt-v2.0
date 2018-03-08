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

var fx;

//uiScreenSpace=0.45;  //take 45% of screen on pop-up

uiBackColor = c_blue;
uiBackColor2 = c_navy;
uiDrawBackColor=true;
uiSetDepth=-99999;



uiRowStartX[1]=10;
uiRowStartY[1]=1;
uiRowSpacingX[1]=0;
uiRow[1]="qwertyuiop";
uiRowShift[1]="QWERTYUIOP";
uiRowAlt[1]="1234567890";

uiRowStartX[2]=30;
uiRowStartY[2]=1;
uiRowSpacingX[2]=0;
uiRow[2]="asdfghjkl";
uiRowShift[2]="ASDFGHJKL";
uiRowAlt[2]="!@$%&-+()";

uiRowStartX[3]=130;
uiRowStartY[3]=1;
uiRowSpacingX[3]=0;
uiRow[3]="zxcvbnm,.";
uiRowShift[3]="ZXCVBNM<>";
uiRowAlt[3]= "[]~\\/:;'"+"\"_=?";

uiRowStartY[4]=1;

uiBackStr="";
uiStateStr="?123";
uiStateStrAlt="ABC";
uiEnterStr="";  //we use sprite index spr_ui
uiShiftStr="";  //we use sprite index spr_ui
uiHideStr="";

uiKeyboardShow=false;
uiKeyboardHide=false;


numkeys=0;
boardw=-1;  


numkeys=string_length(uiRow[1])+string_length(uiRow[2])+string_length(uiRow[3]);

//create letter keys
for (fx=0;fx<numkeys;fx+=1) 
      {
        buttons[fx]=instance_create(-100,-100,ui_button_ani);
      }  


shift_key=instance_create(-100,-100,ui_button_ani);
space_key=instance_create(-100,-100,ui_button_ani);
state_key=instance_create(-100,-100,ui_button_ani);
back_key =instance_create(-100,-100,ui_button_ani);
enter_key=instance_create(-100,-100,ui_button_ani);
hide_key=instance_create(-100,-100,ui_button_ani);


 
curState=0;   //0 = normal ; 1= shift; 2=alt
linespacing=5;
keyboard_width=800;    //fixed ratio do not change
uiKeyboardHeight=270;   //height of keyboard
canfocus=false;  
cap_lock=false;
yfc=0;
xfc=0;
boardy=0;
boardh=0;
butheight=0;
butwidth=0;
isHiding=false; //called when hiding
guiSlide=0;
last_stime=0;  //last shift time for caplocks;


//key colors
uiKeyBackColor=c_silver;
uiKeyBackColor2=c_silver;
uiKeyTextColor=c_black;
uiKeyDownColor=c_yellow;

//special keys
uiSKeyBackColor=c_dkgray;
uiSKeyBackColor2=c_dkgray;
uiSKeyTextColor=c_yellow;
uiSKeyDownColor=c_teal;    

initkeys=true;
//uiEaseMoveType=11;   //straight animation movement;
uiEaseMoveType=40;   //straight animation movement;

uiEaseMoveDur=20;   //quicker
uiTouchKey=true;    //this should be on for mobile, will draw a large keypanel on keypress above finger...
uiBackScale=0.85;    //scale for keyboard button draw,  smaller draw but keypress area is larger area.
uiKeySprite=noone;
uiKeySpriteScale=0.8;

//device_mouse_dbclick_enable(false);   if you are on mobile you should use this for entire game!  it will disable right-click on dbl-click



scr_gui_setdefaults();         //you should set your default properties in this script.





















/* */
/*  */
