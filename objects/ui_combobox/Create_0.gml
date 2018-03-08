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

items[0]="Items Not Set";
itemindex=-1;
lookupid=noone;
uiComboShow = 5;   //# of lines to show before scroll....
left_margin = 5;
lineheight = 24;  //this should be textheight....
uiDrawLines=true;
//position of combobox popup....need it for collision etc.
cx1=1;
cy1=1;
cx2=2;
cy2=2;
uiDrawArrowUp=false;


scr_gui_setdefaults();         //you should set your default properties in this script.



/* */
/*  */
