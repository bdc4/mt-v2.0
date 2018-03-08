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
uiDrawBackColor=true;
uiBackColor=c_silver;
uiToggleOn=true;


uiValue=100;  //for toggle you don't use this,  check/set uiToggleOn=true/false
uiToggleOn=true;
uiBarColor=c_blue;
uiBarColorBlend=c_navy;


uiDrawSquare=false; //rounded or rectange;
uiAniDraw=true; //animate the movement....not jump to position
uiAniSpeed=10;   //step added to value.
uiBarSprite=noone;
uiBackSprite=noone;
uiSpriteScale = 1.0;


uiSetValue=-1;  //read only for toggle...do not use, check uiToggleOn for true/false;

curValueMove=0;  //used to set the movement in change....
curValue=-1;      //used to set movement
curAniCounter=0;

uiSlideSprite = -1;       //sprite must have center as origin.
uiSliderColor = c_white;  //if not using a sprite
uiSlideBarHeight= -1;    //use the entire sprite_height or specify

uiOnLabel="ON";
uiOnLabelColor=c_yellow;
uiOffLabel="OFF";
uiOffLabelColor=c_dkgray;
uiOffAlpha=0.8;
uiOutlineWidth = 1;
uiSliderWidth = -1;
uiSpriteAlign = true;
scr_gui_setdefaults();         //you should set your default properties in this script.













/* */
/*  */
