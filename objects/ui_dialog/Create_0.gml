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
var fx;

event_inherited();

uiBackColor = c_blue;
uiBackColor2 = c_navy;
uiShadowColor= c_dkgray;
uiDialogSprite = -1;
uiSpriteIndex=0;
uiSpriteScale = 1.0;
uiDialogWidth=sprite_width;
uiDialogPosY=-1;     //auto-center;
uiDialogPosX=-1;     //auto-center;
uiDialogResult=-1;   //button result -1 is none, 1=button1..4=button4

uiNumButtons=4;
uiButtonHeight=50;
uiDrawRounded=true;

uiShowDialog=false;
uiSetModal=false;
canfocus=false;
panelfocused=false;



uiTitle=instance_create(x,y,ui_label);
uiSubTitle=instance_create(x,y,ui_label);;
uiCheckBox=instance_create(x,y,ui_checkbox);;
uiButtons1=instance_create(x,y,ui_button_ani);
uiButtons2=instance_create(x,y,ui_button_ani);
uiButtons3=instance_create(x,y,ui_button_ani);
uiButtons4=instance_create(x,y,ui_button_ani);

uiEditBox1=instance_create(x,y,ui_editbox);
uiEditBox2=instance_create(x,y,ui_editbox);

uiTitle.uiAlign=fa_center;
uiTitle.uiTextColor=c_teal;
uiTitle.uiDrawShadows=3;
uiTitle.uiBackColor2=c_dkgray;
uiTitle.uiCenterWrap=false;
uiTitle.uiAnchor=self.id;
uiTitle.uiAnchorPos=false;




uiSubTitle.uiAlign=fa_center;
uiSubTitle.uiTextColor=c_white;
uiSubTitle.uiDrawShadows=3;
uiSubTitle.uiBackColor2=c_dkgray;
uiSubTitle.uiAnchor=self.id;
uiSubTitle.uiAnchorPos=false;



uiCheckBox.uiAlign=fa_right;
uiCheckBox.uiAnchor=self.id;
uiCheckBox.uiAnchorPos=false;
uiCheckBox.uiAnchorProps=false;
uiCheckBox.uiVisible=false;
uiCheckBox.uiTextColor=c_green;

uiEditBox1.uiAnchor=self.id;
uiEditBox1.uiAnchorPos=false;
uiEditBox1.uiAnchorProps=false;
uiEditBox1.uiVisible=false;
uiEditBox1.uiTextLabel="";
uiEditBox1.uiTabOrder=90001;

uiEditBox2.uiAnchor=self.id;
uiEditBox2.uiAnchorPos=false;
uiEditBox2.uiAnchorProps=false;
uiEditBox2.uiVisible=false;
uiEditBox2.uiTextLabel="";
uiEditBox2.uiPasswordChar="*";
uiEditBox2.uiTabOrder=90002;


for (fx=1;fx<=uiNumButtons;fx+=1)
{
   switch (fx)
    {
      case 1: curb=uiButtons1; break;
      case 2: curb=uiButtons2; break;
      case 3: curb=uiButtons3; break;
      case 4: curb=uiButtons4; break;
    }  //switch      
  with (curb) do
  {
  uiBackColor=c_white;
  uiBackColor2=c_white;
  uiShadowColor=c_black;
  uiTextColor=c_black;
  uiVisible=false;
  uiTextValue="";
  uiSetHeight=other.uiButtonHeight;
  uiEventObject=other.id;
  uiControlName="button"+string(fx);  //set control name;
  uiAnchor=other.id;
  uiAnchorPos=false;
  uiAnchorProps=false;
  
  }
} //for loop



uiVisible=false;




scr_gui_setdefaults();         //you should set your default properties in this script.

































/* */
/*  */
