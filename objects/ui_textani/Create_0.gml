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

uiPath=-1;
uiPathSpeed=0;
uiPathAbsolute=false;  //follow absolute path or relative path....
uiTypeSpeed=3;
uiAniStart=0;       //just show textart
uiAniDuration=30;
uiAniEnd=0;        //just stop showing


uiAlignV=fa_middle;
uiAlign=fa_center;
uiAlignAni=fa_center;    //usually draw text aligned within control

CurDispText="";
CurStartIndex=1;  //first char in string;
CurInMotion = false;
CurCanDraw = false;
CurAnimated = false;

uiCArray="";
uiCArrayXpos=0;
uiCArrayYpos=0;
uiCArrayRot=0;
uiCArrayZoom=0;
uiCArrayAlpha=0;
uiCArrayColor=0;

//animate stuffs
CurWobble=0;
CurPulse=1;
CurFading=1;
CurSparkle=0;
CurTextWobble=0;
CurTypeIndex=1;
CurAniCounter=1;    //counter for step animation...
uiTextFixed=false;
uiTextEffect=0;  //defaults to same on all chars  1=alternate 2=random;



scr_gui_setdefaults();         //you should set your default properties in this script.


/* */
/*  */
