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

var disptx,px,numitems,fx,cury,th,ymargin,checkstat;


event_inherited();


bottom=false;
numitems=array_length_1d(items);

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);



if numitems==0 numitems=1;
lineheight = (sprite_height) div numitems;   //normal its just the divide by elements, but maybe theres a header and need to take into account.
  
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     



cury=0;

if uiTextLabel != ""
   {
        //draw header with uiTextLabel
        th=string_height(string_hash_to_newline(uiTextLabel)) + 5;
        draw_roundrect_color_ext(x, y, x+sprite_width, y-th, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, false);   //fill

        //draw uiTextLabel centered.
        draw_set_color(uiBorderColor);
        px= x + (sprite_width div 2);
        draw_set_halign(fa_center);
        draw_text_transformed(px,y-th+2,string_hash_to_newline(uiTextLabel),uiXscale,uiYscale,0);  
   }

   
th=lineheight;

if uiDrawBackColor    //draw background
   {
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, true);   //draw outline    
   } 

   
   
//draw_text(10,10,"alpha "+string(uiAlpha));// DEBUG LINE...
    

draw_set_halign(uiAlign);


for (fx=0;fx<numitems;fx+=1)    //go through each item in the list;
{  
   disptx=items[fx];  
  
      
   while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width - 40)   //clip strings if they are too long
     { 
        disptx=string_delete(disptx,string_length(disptx),1);
        if string_length(disptx)<2 break;
     }

    px=x;   
    if uiAlign==fa_left { px=x +5; } 
       else if uiAlign==fa_middle {px= x + ((sprite_width-40) div 2); }
         else if uiAlign==fa_right {px = x+sprite_width-40; } 
         
    //center text;
    ymargin= (lineheight-string_height(string_hash_to_newline(disptx))) div 2;          

    draw_set_color(uiTextColor);  
    draw_text_transformed(px,y+cury+ymargin,string_hash_to_newline(disptx),uiXscale,uiYscale,0);
    
    if (fx != numitems-1) then  //don't draw lines on last item
      {
        draw_set_color(uiBorderBackColor);  //draw lines
        draw_line_width(x,y+cury+th,x+sprite_width,y+cury+th,1);   
      }

    ymargin= (lineheight - (sprite_get_height(sprite_index))) div 2 ;

    //draw checkbox
    checkstat=false;
    if uiMultiSelect then checkstat=itemschecked[fx];       
         else if itemindex==fx checkstat=true;
         
    if checkstat {draw_sprite(sprite_index,2,x+sprite_width - 40,y+cury+ymargin)}
            else {draw_sprite(sprite_index,1,x+sprite_width - 40,y+cury+ymargin)}
   
cury+=th;
 
}  //for each item


draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   






/* */
/*  */
