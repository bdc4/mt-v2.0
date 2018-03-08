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


var ymargin,disptx,px,py;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming    


disptx=uiTextValue;

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


px=x;
py=y;

if uiDrawRectangle { uiRadiusX=0;uiRadiusY=0;}

if (uiDrawBackColor)  
   {
    draw_set_color(uiBackColor);  
    if uiBackColor2==0 uiBackColor2=uiBackColor;
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY, uiBackColor,uiBackColor2,uiDrawOutline);   //fill
       
    px=x+2;  //need to set drawing sprite inside the rectangle.
    py=y+2;   
   } 
   
if uiPanelSprite>=0 then
   {
       if uiSpriteScale==0  {
                             draw_sprite_stretched_ext(uiPanelSprite,uiSpriteIndex,px,py,sprite_width-(px-x),sprite_height-(py-y),image_blend,uiAlpha);         
                            }  //stretch image to fit.
       else draw_sprite_stretched_ext(uiPanelSprite,uiSpriteIndex,px,py,(sprite_get_width(uiPanelSprite)*uiSpriteScale),(sprite_get_height(uiPanelSprite)*uiSpriteScale),image_blend,uiAlpha);
   }   
   
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc      
      

/* */
/*  */
