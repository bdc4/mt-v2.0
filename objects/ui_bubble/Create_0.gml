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
uiBubbleSprite=noone;
uiSpriteScale=0;       //must leave this at 0
uiSpriteIndex=0;
uiTextValue="";
uiBubblePos=0;  //0=bottom left default, clockwise 1,2,3
uiTextPosX=10;  //added to x .  Text will be centered
uiTextPosY=10;
uiTextWidth=sprite_width*0.80;  //80% of bubble width
uiTextHeight=sprite_height*0.80;
uiKillPress=true;  //default if user presses bubble it will fade and destory;
uiAutoDestroy=true;  //will kill the button after time;  factor
uiCloseFactor=1;   //if autoclose will use # of characters in string * factor;
uiAutoSize=true;   //this will adjust the bubble size based on the uiMemo;
uiAlign=fa_center;
canfocus=false;
uiBubbleWidth=sprite_width;
uiBubbleMin=50;
uiFadeOnKill=true;   //default is to fade or to popdown...





uiDrawBackColor=true;
uiBackColor=c_white;
uiBackColor2=c_black;
uiTextColor=c_black;
canfocus=false;
curLB = instance_create(x,y,ui_label);
curLB.uiVisible=false;


bubbleh=-1;   //internal button height;
last_st="";  //last value of textvalue;
alpha_destroy=false;
drawX=x;
drawY=y;


curZoomFactor=1;
curAlpha=1;
curRot=0;




scr_gui_setdefaults();         //you should set your default properties in this script.












/* */
/*  */
