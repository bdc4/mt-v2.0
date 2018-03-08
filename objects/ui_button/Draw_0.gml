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

var ymargin,disptx,px,py,bx,by,yratio,drawbutdown;

event_inherited();

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   

disptx=uiTextValue;

     

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


if (uiDrawBackColor && uiButtonState==0 && uiDrawOutline==false)  //if draw background and state = up.
   {
    draw_set_color(uiShadowColor);  
    draw_roundrect_color_ext(x+3, y+3, x+sprite_width+3, y+sprite_height+3,uiRadiusX,uiRadiusY,uiShadowColor,uiShadowColor, false);   //fill
   } 
   
drawbutdown=false;
if (uiButtonState==1 || drawpress) then drawbutdown=true;


if (drawbutdown==false) {bx=0;by=0;} else {bx=3;by=3;};   
   
if (uiDrawBackColor)  
   {
    draw_set_color(uiBackColor);  
    if uiBackColor2==0 uiBackColor2=uiBackColor;
    if (drawbutdown==false)
       draw_roundrect_color_ext(x+bx, y+by, x+sprite_width+bx, y+sprite_height+by, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor2,uiDrawOutline);   //fill
       else draw_roundrect_color_ext(x+bx, y+by, x+sprite_width+bx, y+sprite_height+by, uiRadiusX,uiRadiusY, uiDownColor,uiDownColor,uiDrawOutline);   //fill
   } 
   
if uiFlashButton then
   {
   uiFlashCounter +=1;
   px = room_speed/30;
  if (uiFlashCounter mod (5*px)) < (3*px)
        {
           draw_set_color(uiDownColor);  
           draw_roundrect_color_ext(x+bx, y+by, x+sprite_width+bx, y+sprite_height+by, uiRadiusX,uiRadiusY, uiDownColor,uiDownColor, false);   //fill
        }             
   }   
   
   
   
if drawbutdown==false {image_blend=c_white;} else image_blend=uiBackColor;

      
if uiButtonSprite>=0 then
   {
         px=x; 
         if uiSpriteAlign==fa_left { px=x +5; } 
            else if uiSpriteAlign==fa_center {px= x + ((sprite_width - (sprite_get_width(uiButtonSprite)*uiSpriteScale)) div 2); }
            else if uiSpriteAlign==fa_right {px = x+sprite_width - (sprite_get_width(uiButtonSprite)*uiSpriteScale) -5; } 

         py=y;      
         if uiSpriteAlignV==fa_top { py= y+5; }
            else if uiSpriteAlignV==fa_middle { py=y + ((sprite_height - (sprite_get_height(uiButtonSprite)*uiSpriteScale)) div 2);}  //center text vertically;
            else if uiSpriteAlignV==fa_bottom { py=y+sprite_height - (sprite_get_height(uiButtonSprite)*uiSpriteScale) - 5; }

         if uiSpriteScale==0  {px=x+2;py=y+2;  
                             draw_sprite_stretched_ext(uiButtonSprite,uiSpriteIndex,px+bx,py+by,sprite_width-2,sprite_height-2,image_blend,uiAlpha);         
                            }  //stretch image to fit.
         else draw_sprite_stretched_ext(uiButtonSprite,uiSpriteIndex,px+bx,py+by,(sprite_get_width(uiButtonSprite)*uiSpriteScale),(sprite_get_height(uiButtonSprite)*uiSpriteScale),image_blend,uiAlpha);
   }   
   


while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width)
 { 
    disptx=string_delete(disptx,string_length(disptx),1);
    if string_length(disptx)<2 break;  //failsafe
 }
 
px=x; 
if uiAlign==fa_left { px=x +5; } 
 else if uiAlign==fa_center {px= x + (sprite_width div 2); }
   else if uiAlign==fa_right {px = x+sprite_width -5; } 

py=y;      
if uiAlignV==fa_top { py= y+5; }
 else if uiAlignV==fa_middle { py=y+(sprite_height - (string_height(string_hash_to_newline(disptx)) * uiYscale)) div 2 ;}  //center text vertically;
    else if uiAlignV==fa_bottom { py=y+sprite_height - (string_height(string_hash_to_newline(disptx)) * uiYscale)};
   
    
draw_set_color(uiTextColor);  
if disptx != "" draw_text_transformed(px+bx,py+by,string_hash_to_newline(disptx),uiXscale,uiYscale,0);   

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   

/* */
/*  */
