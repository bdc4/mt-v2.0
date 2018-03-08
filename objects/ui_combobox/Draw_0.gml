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

if uiRefresh { uiRefresh=false;       //will close combobox on global refresh;
               if (uiFocusID != lookupid && uiFocusID != self.id) then alarm[0]=1;  //if we are not the focus object then close;
             }  

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   
             
disptx=uiTextValue;


draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);

draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, !uiDrawBackColor);   //fill

ymargin= (sprite_height - (string_height(string_hash_to_newline(disptx)) * uiYscale)) div 2 ;

while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width)
 { 
    disptx=string_delete(disptx,string_length(disptx),1);
    if string_length(disptx)<3 break;
 }
 

if uiAlign==fa_left { px=x +5; } 
 else if uiAlign==fa_middle {px= x + (sprite_width div 2); }
   else if uiAlign==fa_right {px = x+sprite_width -5; } 
 
draw_set_color(uiTextColor);  
draw_text_transformed(px,y + ymargin,string_hash_to_newline(disptx),uiXscale,uiYscale,0);   

py =( (sprite_height - sprite_get_height(sprite_index)) / 2) +1;


if uiDrawArrowUp
   draw_sprite(sprite_index,5, x+sprite_width-34,y+py);
   else draw_sprite(sprite_index,4, x+sprite_width-34,y+py);
  

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   


/* */
/*  */
