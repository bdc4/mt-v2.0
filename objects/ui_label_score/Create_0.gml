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

uiAlign=fa_center;
uiSetScore=-1;
uiScoreInc=10;  //increment value
uiScoreDec=0;    //number of decimals
uiScoreLength=1; //see string_format function in gms
uiThousandSep=",";
uiEffectAbove=-1;
uiEffectColor=c_yellow;
uiEffectBelow=-1;
uiEffectDelay=5;  //steps
uiTextColorChange=c_green;  //



lscurval=0;
lsdelay=1;  //internal
lsdelta=0;  
lsvalue=0; 
lsinc=0;
lsdisnum=0;
lsanimated=true;
ischanging=false;
lseffectcount=0;

scr_gui_setdefaults();         //you should set your default properties in this script.



/* */
/*  */
