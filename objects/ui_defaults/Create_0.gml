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

uiTextValue="";
uiTextLabel="";
uiBackColor= c_white;
uiDrawBackColor = true;
uiTextColor= c_black;
uiDrawOutline = false;   //fill button when drawing.
uiBorderColor=c_white;
uiBorderBackColor=c_gray;
uiHiliteColor=c_white;
uiHiliteBackColor=c_blue;
uiHiliteBackColor2=c_navy;
uiAlign = fa_left;
uiAlignV = fa_top;
uiFont = font_ui;
uiXscale = 1.0;
uiYscale = 1.0;
uiButtonList = false;  //if set then control is a button list and will send button to eventobj
uiShowArrows = false;
uiEventObject = noone;  //-4 constant
uiEventNum = 0;    //default event is just to call the statechanged on controller object if set
uiControlName = "";
uiMultiSelect = false;
uiAnchor = noone;
uiMoveX=0;
uiMoveY=0;
uiAniMove=false;  //start moving
uiAniX=0;    //don't change
uiAniY=0;    //don't change
uiAniSpeed=0.85;
checked = false;  //default state of checkbox;
modified = false;
inForm=false;
uiDrawSelf=false;
uiPasswordChar="";    //should not change this as default.
uitextboxmsg = -1;    //should not be changed....used for dialon on textboxes.
uiFadeIn=false;
uiFadeOut=false;
uiFadeSpeed=0.8;
uiAlpha=1;
uiImageBlend=c_white;
uiOrigXscale=image_xscale;
uiOrigYscale=image_yscale;
uiOrigWidth=sprite_width;
uiOrigHeight=sprite_height;
uiMouseHandle=true;   //if item overlap then we only process on one control.
uiRefresh=false;      //this will cause all comboboxes to close for now....
uiFocusID=noone;         //instance that has focus used on refresh;
uiZoomIn=false;
uiZoomOut=false;
uiZoomSpeed=0.5;
uiZoomFactor=1;
uiEnabled=true;
uiVisible=true;
isFocused=false;   //weather its in focus




//v1.01 added 
//animate stuffs
uiAnimated=false;
uiWobble=0;
uiWobbleSpeed=1;
uiPulse=0;
uiPulseSpeed=0.01;
uiPulseJello=false; //works with pulse to jello the pulse...
uiFading=0;
uiFadingSpeed=0.03;
uiSparkle=0;
uiSparkleSpeed=1;
uiTextWobble=0;
uiTextWobbleSpeed=1;
uiHoverMode=1;
uiHoverColor=c_dkgray;
uiHoverInfo=0.8;
uiGlowing=0;



draw_set_circle_precision(32);



//v1.2 added
uiAnchorProps=true;   //used to determin if enabled/visible are set for children.

//v1.3 added
uiTabOrder=-1;        //for tab order
uiAssignKey=0;       //to assign a key to buttons/etc...
uiSetWidth=-1;
uiSetHeight=-1;
uiTag=-1;            //free to use for custom stuffs
canfocus=true;       //if control can grab focus 
uiGUIWidth=room_width;
uiGUIHeight=room_height;


//v1.4 added
uiCallBackSound=false;         //if want to do more complex sound/haptic then use this and then set the sounds to custom_scripts;
uiClickSound=-1;              //if not using callback, you can set your snd_xxx here.
soundindex=-1;                 //don't touch this....
uiAnchorPos=true;              //if anchor children take the xpos/ypos changes...
uiCurWidth=sprite_width;
uiCurHeight=sprite_height;
uiCustomDrawBack=noone;       //if you want to draw a custom background on panel, listbox, etc.


//default ease
uiEaseType=25;                 //type of ease based on JQuery Easing Plugin
uiEaseDur=30;                  // steps

uiEaseMoveType=40;             //movement animation type of ease based on JQuery Easing Plugin
uiEaseMoveDur=30;              // steps
uiEaseWobbleType=31;            //Wobble animation type of ease based on JQuery Easing Plugin
uiEaseWobbleDur=40;            // steps
uiEasePulseType=36;             //Pulse Animation type of ease based on JQuery Easing Plugin

uiEasePulseDur=40;             // steps
uiEaseFadeType=0;              // for Fade/glowing Animation type of ease based on JQuery Easing Plugin
uiEaseFadeDur=50;              // steps

uiEaseCurTime=0;               // current time  don't need to set
uiEaseStart=0;                 // beginning value
uiEaseEnd=1  ;                 // ending value
uiEaseCurValue=1;              // CurValueofEase
inEase=false;                  // internal flag
EaseKind=-1;                   // internal type

uiAniWobble=0;                 // animation wobble;
uiAniPulse=0;                  // animation zoom/pulse
uiAniFading=0;                 // animation fading
CurFading=0;                   // used for hovering;
uiAniDrawGlow=false;           // hover glowing
isHovering = false;            // hover status on widget
uiCanHover=false;              // used for hovering;
uiAngle=0;                     // for all widgets to store angle.
uiRadiusX=15;
uiRadiusY=15;
uiPopUp=false;                 //animation for popup.
uiPopDown=false;               //animation for popdown.
curHoverZoom=0;                //hoverzoom factor
backalpha=1;
inAnimation=false;
uiVisibleChild=true;
uiEnabledChild=true;
uiClickOnChar=chr(1);            //will press button/control if keypress
uiDestroy=-1;                    //fill fadeout & destory instance on steps, for splash labels and such...
killonfade=false;                //internal flag don't touch... 


//added v1.4.2
uiViewFixed=false;              //set to true will force x,y to be based on current view
uiMoving=false;               //set when in movement animation





//always put this line as last line....
scr_gui_setdefaults();  




/* */
/*  */
