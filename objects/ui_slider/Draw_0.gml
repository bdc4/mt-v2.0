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


var ymargin,disptx,px,slideper,upst;

event_inherited();

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     


disptx=uiTextValue;

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


ymargin= (sprite_height - uiLineWidth) div 2;




//calculate % of slider to draw

if (uiValue mod uiInterval) != 0  uiValue= (uiValue div uiInterval) * uiInterval;





if (uiMax-uiMin) != 0 
  { slideper= ((uiValue - uiMin) / (uiMax-uiMin));} 
else {slideper=0;}


//draw selector

select_xpos = x+ uiSelectSize + round( (sprite_width - (uiSelectSize * 2)) * slideper);  //set selector position
select_ypos = y+(sprite_height div 2);

if uiLineSprite == -1 {
    if (uiDrawBackColor) {
        if uiBackColor2==0 uiBackColor2=uiBackColor;
        draw_rectangle_color(x, y+ymargin, x+sprite_width-2, y+ymargin+uiLineWidth, uiBackColor,uiBackColor, uiBackColor2,uiBackColor2, uiDrawOutline);   //fill
    }
    
    //draw border 
    draw_set_color(uiBorderColor);  
    if uiBorderColor != 0 draw_rectangle(x, y+ymargin, x+sprite_width-2, y+ymargin+uiLineWidth,true); 
} else draw_sprite(uiLineSprite, 0, x, y+ymargin);  //draw line sprite.


if uiSlideSprite== -1 
 {
  draw_circle_color(select_xpos, select_ypos , uiSelectSize, uiHiliteColor,uiHiliteColor2,false) //draw background
  if uiBorderColor != 0 draw_circle_color(select_xpos, select_ypos , uiSelectSize, uiBorderColor,uiBorderColor,true) //draw border outline
 } else
   {draw_sprite(uiSlideSprite,0,select_xpos,select_ypos);}  //sprite origin must be center
   
    

if uiUpdateLabel != noone  //if updatelabel is set...
   {
     if instance_exists(uiUpdateLabel) then
        { upst= string(uiValue)+uiSliderUnits;
          with (uiUpdateLabel) { uiTextValue = upst; }     
        }  
   }      

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   



/* */
/*  */
