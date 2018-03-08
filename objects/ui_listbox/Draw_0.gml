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

var disptx,px,numitems,fx,cury,th;

event_inherited();

numitems=array_length_1d(items);

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


lineheight=string_height(string_hash_to_newline("XgpT@"))*uiYscale + uiLineSpacing;

totheight=numitems * lineheight;  //info only for other controls.

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   


th=lineheight;

bottomline=((numitems*lineheight)-sprite_height) * -1;  //top drawy line for bottom clip.

if uiDrawHeader 
   {
      if bottomline >= th {noscroll=true}
         else 
         {   //enabled scrolling...
               noscroll=false;
               bottomline = bottomline - (th *2) ; //bottom clip takes up a line.          
             }        
   }
else 
   {
      if bottomline >= 0 {noscroll=true}
         else 
         {   //enabled scrolling...
               noscroll=false;
               bottomline = bottomline - (th *1) ; //bottom clip takes up a line.          
         }               
   }   
   
   
if uiDrawSquare { uiRadiusX=0;uiRadiusY=0;}


if uiDrawBackColor    //draw background
   {
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, true);   //draw outline    
   } 

   
   

draw_set_halign(uiAlign);


if uiDrawHeader cury=drawy+th; else cury=drawy;   

if uiCustomDrawScript = -1  //default drawing (not custom)
  for (fx=0;fx<numitems;fx+=1)    //go through each item in the list;
  {  
   disptx=items[fx];  
  
      
   while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width)   //clip strings if they are too long
     { 
        disptx=string_delete(disptx,string_length(disptx),1);
        if string_length(disptx)<2 break;
     }

     
  if uiAlign==fa_left { px=x +5; } 
   else if uiAlign==fa_middle {px= x + (sprite_width div 2); }
   else if uiAlign==fa_right {px = x+sprite_width -5; } 

   draw_set_color(uiTextColor);  


   if (cury >=0) then  //if line visible;
    {
     if (itemindex==fx) && (uiDrawHilite==true)       //if hilited item
         {// draw_set_color(uiHiliteBackColor);
           draw_rectangle_color(x, y+cury, x+sprite_width-1, y+cury+th,uiHiliteBackColor,uiHiliteBackColor2,uiHiliteBackColor,uiHiliteBackColor2,false);   //fill hilite;
           draw_set_color(uiHiliteColor);  //set text color  
         }

    draw_text_transformed(px+uiLeftMargin,y+cury+2,string_hash_to_newline(disptx),uiXscale,uiYscale,0);     
    
    if uiShowArrows draw_sprite(sprite_index,3, x+sprite_width - 40,y+cury);
    
    if (itemindex!=fx) && uiDrawLines then  // draw lines between items
      {
         draw_set_color(uiBorderBackColor);
         draw_line_width(x,y+cury+th,x+sprite_width,y+cury+th,1);    
      } 
    }  
   
  cury+=th;
  if noscroll {if (cury)>(sprite_height) break;}
       else {if (cury)>(sprite_height-th) break;}
  }  //for each item of default drawing;

if uiCustomDrawScript != -1  //Custom Drawing;
   for (fx=0;fx<numitems;fx+=1)    //go through each item in the list;
   {
    if cury>=0  //if visible
     {
     script_execute(uiCustomDrawScript,self.id,fx,x,y+cury,th);
     }
   //cury+=lineheight; 
   cury+=th;  //only allow fixed heights in text drawing (not surfaces)
   if noscroll {if (cury)>(sprite_height) break;}
     else {if (cury)>(sprite_height-th) break;}
   }




//draw bottom clip


//draw header with uiTextLabel
if uiDrawHeader
{
draw_roundrect_color_ext(x, y, x+sprite_width, y+th, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, false);   //fill
}

//draw uiTextLabel centered.
draw_set_color(uiBorderColor);
px= x + (sprite_width div 2);
draw_set_halign(fa_center);
if uiTextLabel !="" draw_text_transformed(px,y+2,string_hash_to_newline(uiTextLabel),uiXscale,uiYscale,0);  

if (noscroll==false)  //scrolling;
  {
     draw_roundrect_color_ext(x, y+sprite_height-th, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, false);   //fill
  }   
  
if (noscroll==false) && (uiScrollArrows=true)  
   { curArrowPulse += curArrowSpeed;
     if curArrowPulse > 1 {curArrowSpeed *= -1;}
        else if curArrowPulse < 0.3 {curArrowSpeed *= -1;}          
     if drawy<0 draw_sprite_ext(sprite_index,5,x+sprite_width-40,y+2,1,1,0,uiScrollColor,curArrowPulse);
     if drawy>bottomline draw_sprite_ext(sprite_index,4,x+sprite_width-40,y+sprite_height-30,1,1,0,uiScrollColor,curArrowPulse);              
   }  

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   







/* */
/*  */
