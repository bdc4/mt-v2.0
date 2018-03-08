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

uiBackColor = c_navy;
uiBackColor2 = c_blue;
uiDrawRectangle=false;
uiPanelSprite = -1;
uiSpriteIndex=0;
uiSpriteScale = 1.0;
uiSetModal=false;
canfocus=false;



//save states of children or when panel is the uiAnchor of object;
OldEnabled=-1;   //-1 init, 0 = false, 1 = true
OldVisible=-1;   
whatchanged=0;  //0=nothing, 1= enabled= 2 = visible

array_ids=0;       //store id's of children
array_Enabled=0;   //stores enabled of children (uiAnchor parent);
array_Visible=0;   //stores visible of children

panelfocused=false;




scr_gui_setdefaults();         //you should set your default properties in this script.
















/* */
/*  */
