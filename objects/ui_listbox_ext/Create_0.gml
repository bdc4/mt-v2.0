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

items[0]="";
itemspos[0]=0;  //array of line#s for variable height rows for selection
itemindex=-1;

CurSurface = -1;


numlines = 0;      //number of lines.
mouse_move = false;
mouse_movex = false;   //weather we are moving left-right.
mouse_pressedy=0;
mouse_pressedx=0;
mouse_origy = 0;
mouse_time = 0;
mouse_click = false;
first_press = false; //for mouse first press and direction
rubbery = 30 ; //number of pixels to rubberband in y
rubberx = 30 ; //number of pixels to rubberband in x
rubberbanding = false; //if we are rubberbanding then dont process mouse.
bandstep = 0;
groupheight = 0;  //height of report in pixels.
viewheight = sprite_height;  //viewable height
topclip = 0;  //line in room that is top position;
bottom=false;  //use to determine if report is showing last item currently.
bottomline = 0 ;  //will determine the drawy bottomline;
topstart=0;
left_margin = 5;
lineheight = 24;  //this should be textheight....
line_clicked = -1; //index of selected item;
drawy=0;
drawx=x;
startline=0;
flicked = 0;  //if was swiped then set flicked 
noscroll=false;
uiDrawLines=true;
uiDrawHeader=true;
uiDelayEvent=1;     //if you want to delay the press to call event (for highlighting)
uiDrawSquare=true;  //because of surfaces, be can't be rounded here...
uiComboID=noone;  //set to the instance id of combo object id. for callback.
uiMemo="";
uiHoverSelect=false;  //set to true to select on mouse hover
uiDrawHilite=true;
uiCredits=false;
uiCustomDrawScript=-1;
uiSurfaceHeight=0;  //override surface height (Default is textheight * numitems)
uiScrollArrows=true;
uiScrollColor=c_dkgray;
uiMoveToTop = false;   //will reset the drawy position to top
curArrowPulse=1;
curArrowSpeed=0.05;
maxLineHeight=128;  //this is important, do not make too large or else surface will be larger!!  This is the maximum height you can make an individual line.

uiLineSpacing = 5;
uiLeftMargin = 0;

scr_gui_setdefaults();         //you should set your default properties in this script.


/* */
/*  */
