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

var ymargin,disptx,px,py,fx,lh,cury,fg,curXscale,curYscale;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     


curZoomFactor=uiZoomFactor+uiAniPulse;
curAlpha=uiAlpha-uiAniFading;
curRot=uiAngle+uiAniWobble;

curXscale=uiXscale+uiAniPulse;
curYscale=uiYscale+uiAniPulse;


draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(uiAlignV);
//draw_set_alpha(curAlpha);


if (uiAniPulse != 0)  && (uiPulseJello)
   { if uiAniPulse >= 0  {curYscale=(uiYscale)-uiAniPulse;}
               else      {curXscale=(uiXscale)-uiAniPulse;}
   }  
             

if (lasttext!=uiTextValue) //|| (uiAniPulse!=0)  //if string is too long we need to wordwrap
 { 
  lasttext=uiTextValue;  //keep copy to see if changed.

//  if ((string_width(uiTextValue+'X') * curXscale) > (sprite_width)) 
  if ((string_width(string_hash_to_newline(uiTextValue+"X"))) > (sprite_width))   
   {
     event_user(1); //breaks apart string into items array;
   } else 
       {multLines=false;  //reset if one line fits....
        items=0;
        items[0]=uiTextValue;
        numitems=1;
        };         
 }


if multLines==false {items[0]=uiTextValue;}    //if just one line then just set one array item;


lh=(string_height(string_hash_to_newline("XgpT"))*curYscale);   //lineheight;
uiCurHeight=(numitems * (lh+uiLineSpacing));  //info only for other controls.



if uiDrawBackColor 
   {
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill
   } 

if (uiCenterWrap) || (numitems=1) {ymargin= (sprite_height - (uiCurHeight * curYscale)) div 2 ;} else {ymargin=0;}  //center in area or top

 
if uiAlign==fa_left { px=x +5; } 
 else if uiAlign==fa_middle {px= x + (sprite_width div 2); }
   else if uiAlign==fa_right {px = x+sprite_width -8; } 

   
cury=y+ymargin;   
   
if uiDrawOutlines>0   //draw shadows
   {
    draw_set_color(uiBackColor2);  
     for (fg=1;fg<=uiDrawOutlines;fg+=1)  
       {
        for (fx=0;fx<numitems;fx+=1)   
          {  disptx=items[fx];
             draw_text_transformed(px,cury-fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px,cury+fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px+fg,cury,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px-fg,cury,string_hash_to_newline(disptx),curXscale,curYscale,curRot);                
             draw_text_transformed(px+fg,cury+fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px-fg,cury-fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px+fg,cury-fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
             draw_text_transformed(px-fg,cury+fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);                
             
             cury=cury+lh+uiLineSpacing;     
          }           
        cury=y+ymargin;    
       }   
   }
   
if uiDrawShadows>0   //draw shadows
   {
    draw_set_color(uiBackColor2);  
     for (fg=1;fg<=uiDrawShadows;fg+=1)  
       {
        for (fx=0;fx<numitems;fx+=1)   
          {  disptx=items[fx];
             draw_text_transformed(px+fg,cury+fg,string_hash_to_newline(disptx),curXscale,curYscale,curRot);               
             cury=cury+lh+uiLineSpacing;     
          }           
        cury=y+ymargin;    
       }   
   }   
   


cury=y+ymargin;   

for (fx=0;fx<numitems;fx+=1)   
  {  disptx=items[fx];
     draw_set_color(uiTextColor);  
     draw_text_transformed(px,cury,string_hash_to_newline(disptx),curXscale,curYscale,curRot);   
     cury=cury+lh+uiLineSpacing;     
  }   
  
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc     

/* */
/*  */
