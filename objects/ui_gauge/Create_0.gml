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


uiValue=100;  //percent based 100....so 50 is 0 percent, use to read-only , use uiSetValue to set!!!
uiBarColor=c_green;
uiBarColorBlend=c_lime;
uiBarLevel=35;
uiBarColor2=c_yellow;
uiBarColorBlend2=c_white;

uiBarLevel2=10;
uiBarColor3=c_red;
uiBarColorBlend3=c_maroon;

uiBarFlash=15; //0=no flash,  else speed to flash flash on level3 (dying...);
uiDrawSquare=false; //rounded or rectange;
uiAniDraw=true; //animate the movement....not jump to position
uiAniSpeed=1;   //step added to value.
uiBarSprite=noone;
uiBackSprite=noone;
uiSpriteScale = 1.0;


uiSetValue=-1;  //use this to set the value...don't access...percent based 100....

curValueMove=0;  //used to set the movement in change....
curValue=-1;      //used to set movement
curAniCounter=0;



scr_gui_setdefaults();         //you should set your default properties in this script.













/* */
/*  */
