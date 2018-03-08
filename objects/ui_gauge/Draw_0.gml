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

var ymargin,disptx,px,curPercent,barWidth,flashDraw,curColor,curBlendColor,ch,cw,tw,barx,bary,barw,barh,xratio,yratio;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     

disptx=uiTextValue;

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);

if uiDrawSquare {uiRadiusX=0;uiRadiusY=0;}

barx=x;
bary=y;
barw=sprite_width;
barh=sprite_height;

if uiBackSprite != noone  //if we are using a background sprite behind/around the gauge, we use bounding box to get gauge location/size
  {
   if uiSpriteScale==0 {   xratio=sprite_width/sprite_get_width(uiBackSprite);
                           yratio=sprite_height/sprite_get_height(uiBackSprite);
                       } else
                       {   xratio=uiSpriteScale;
                           yratio=uiSpriteScale;
                       }         
    barx=(sprite_get_bbox_left(uiBackSprite)*xratio);
    bary=(sprite_get_bbox_top(uiBackSprite)*yratio);
    barw=(sprite_get_bbox_right(uiBackSprite)*xratio)-barx;
    barh=(sprite_get_bbox_bottom(uiBackSprite)*yratio)-bary;    
    barr=(sprite_get_bbox_bottom(uiBackSprite)-sprite_get_bbox_top(uiBackSprite));  //original bar height
    barx+=x;
    bary+=y;
  } 
  
if uiDrawBackColor 
   {
    draw_roundrect_color_ext(barx, bary, barx+barw, bary+barh, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor,false);   //fill
   } 
   

if uiSetValue != -1      //if changed then set the bar in motion.....
  {  
  if uiAniDraw  //animate motion of bar 
   {
    if curValue != -1   //init value check
     {curValueMove = uiSetValue - curValue;}
     else {curValue=uiSetValue;}   //on first set set don't animate....?
     uiValue=uiSetValue;
     uiSetValue=-1;  
   } else   //no animation
     {
     curValue=uiSetValue;
     uiValue=uiSetValue;
     uiSetValue=-1;
     curValueMove=0;
     }  
  }   
   
if curValue==-1 curValue=uiValue;   //initialize;
  
curPercent=curValue;

if curValueMove > 0 
   {curPercent += min(curValueMove,uiAniSpeed);
    curValueMove -= uiAniSpeed;
    if curValueMove <0 curValueMove=0;    
   }
else if curValueMove <0 
   {curPercent -= min(abs(curValueMove),uiAniSpeed);
    curValueMove += uiAniSpeed;
    if curValueMove >0 curValueMove=0;    
   }

curValue=curPercent;


barWidth:=round((curValue/100) * barw);


drawFlash=true;
if curValue>=uiBarLevel {curColor=uiBarColor; curColorBlend=uiBarColorBlend;}
  else if curValue>=uiBarLevel2 {curColor=uiBarColor2; curColorBlend=uiBarColorBlend2;}
    else { if uiBarFlash>0 {if (curAniCounter mod uiBarFlash)== 1  drawFlash=false;}
           curColor=uiBarColor3;
           curColorBlend=uiBarColorBlend3;
           curAniCounter +=1;
         }  


//draw_text_transformed(px+5,y,disptx,uiXscale,uiYscale,0);   

if uiBackSprite!=noone then
   {
       if uiSpriteScale==0  {
                             draw_sprite_stretched_ext(uiBackSprite,0,x,y,sprite_width,sprite_height,image_blend,uiAlpha);         
                            }  //stretch image to fit.
       else draw_sprite_stretched_ext(uiBackSprite,0,x,y,(sprite_get_width(uiBackSprite)*uiSpriteScale),(sprite_get_height(uiBackSprite)*uiSpriteScale),image_blend,uiAlpha);
   }  


if (uiBarSprite != noone) //drawing background sprite
   {
     cw=sprite_get_width(uiBarSprite);
     ch=sprite_get_height(uiBarSprite);
     
     draw_sprite_stretched_ext(uiBarSprite,0,barx,bary,cw,barh,c_gray,0.5);
     draw_sprite_stretched_ext(uiBarSprite,1,barx+cw,bary,barw-cw-cw,barh,c_gray,0.5);
     draw_sprite_stretched_ext(uiBarSprite,2,barx+barw-cw,bary,cw,barh,c_gray,0.5);
     
     if drawFlash 
     {
      if barWidth>(cw*2)
       {
          draw_sprite_stretched_ext(uiBarSprite,0,barx,bary,cw,barh,curColor,1);
          draw_sprite_stretched_ext(uiBarSprite,1,barx+cw,bary,barWidth-cw-cw,barh,curColor,1);
          draw_sprite_stretched_ext(uiBarSprite,2,barx+barWidth-cw,bary,cw,barh,curColor,1);
       }
      else  {
          tw=max(barWidth div 2,0); //draw /merge left/right sprites.
          if tw>0
             {         
                 draw_sprite_part_ext(uiBarSprite,0,0,0,tw,ch,barx,bary,1,barh/ch,curColor,1);
                 draw_sprite_part_ext(uiBarSprite,2,cw-tw,0,cw-(cw-tw)-1,ch,barx+tw,bary,1,barh/ch,curColor,1);          
             }  
           }       
     } //draw flash;      
   }


if (curValue>0 ) && (drawFlash) && (uiBarSprite=noone)
 {
   draw_roundrect_color_ext(barx, bary, barx+barWidth, bary+barh, uiRadiusX,uiRadiusY,curColor,curColor, false);   //fill
 }      
 
if uiDrawBackColor  //draw border
  {
    draw_roundrect_color_ext(barx, bary, barx+barw, bary+barh, uiRadiusX,uiRadiusY,uiBorderColor,uiBorderColor, true);   //fill 
  }     
  
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc    
  
  
  
  
  
    

       


/* */
/*  */
