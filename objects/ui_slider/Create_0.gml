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


uiMax=100;
uiMin=1;
uiInterval=5;
uiValue=50;     //integer

uiLineWidth=5;
uiSelectSize=15; //radius of circle

uiBorderColor=c_navy;  //outline of line

uiBackColor = c_navy;
uiBackColor2 = c_blue;

uiHiliteColor  =  c_white; //outline of selector
uiHiliteColor2 =  c_teal;  //background of selector

uiSlideSprite = -1;  //if using a sprite for slider select
uiLineSprite  = -1;  //if using a sprite for line.

uiHorizontal = true;   //set to false for vertical
uiUpdateLabel = noone;    //will set the textlabel of uiUpdateLabel to uiValue on change;



mouse_move = false;
mouse_origx = 0;
mouse_origy = 0;


select_xpos = 0;
select_ypos = sprite_height div 2;
last_per = 0;  //dont' touch
uiSelectSize = sprite_height div 2; //default size to height









scr_gui_setdefaults();         //you should set your default properties in this script.















/* */
/*  */
