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

var ymargin,disptx,px,curPercent,barWidth,flashDraw,curColor,curBlendColor,ch,cw,tw,barx,bary,barw,barh,xratio,yratio,sw,ow;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   


curZoomFactor=uiZoomFactor+uiAniPulse;
curAlpha=uiAlpha-uiAniFading;
curRot=uiAngle+uiAniWobble;

curXscale=uiXscale+uiAniPulse;
curYscale=uiYscale+uiAniPulse;  

disptx=uiTextValue;

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);

if uiDrawSquare {uiRadiusX=0;uiRadiusY=0;}

ow = uiOutlineWidth;
barx=x;
bary=y;
barw=sprite_width;
barh=sprite_height;



if (uiSlideBarHeight>0) //custom bar height
  {
     bary = y+ ((sprite_height - uiSlideBarHeight) div 2);
     barh = uiSlideBarHeight;
  }


if (uiToggleOn==false) draw_set_alpha(uiOffAlpha);

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
    if (ow>0) draw_roundrect_color_ext(barx-ow, bary-ow, barx+barw+ow, bary+barh+ow, uiRadiusX,uiRadiusY,uiBorderColor,uiBorderColor, false);   //fill         
    draw_roundrect_color_ext(barx, bary, barx+barw, bary+barh, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor,false);   //fill
   } 

if (uiToggleOn && uiValue==0) uiSetValue=100;
else if (uiToggleOn==false && uiValue==100) uiSetValue=0;

      

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



curColor=uiBarColor;
curColorBlend=uiBarColorBlend;


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
   }


if (curValue>0 ) && (uiBarSprite=noone)
 {
   draw_roundrect_color_ext(barx, bary, barx+barWidth, bary+barh, uiRadiusX,uiRadiusY,curColor,curColor, false);   //fill
 }      
 
   
  
//uiSlideSprite = -1;  


//draw slide
if (uiSlideSprite==-1)  //no slidesprite; draw roundrect;
    {
    if (uiSliderWidth<=0) sw=(barw div 3); else sw=uiSliderWidth;       
    sx=max(x,barx+barWidth-(sw div 2)); //set low pos
    sx=min(sx,barx+barw-sw); //set hi pos
    draw_roundrect_color_ext(sx, bary,sx+sw, bary+barh, uiRadiusX,uiRadiusY,uiSliderColor,uiSliderColor, false);   //fill     
    }
else  //draw slidesprite
    {    
    if (uiSpriteAlign)  //draw slidesprite within bar
     {
      sw=sprite_get_width(uiSlideSprite);
      sx=max(x+(sw div 2),barx+barWidth-(sw div 2)); 
  //    sx=min(sx,(barx+barw-(sw div 2)));
      draw_sprite(uiSlideSprite,0,sx+1,bary+(barh div 2)+1);
     } 
    else  //draw slidesprite to full bar
    {  
       sx=barx+barWidth; 
       draw_sprite(uiSlideSprite,0,sx,bary+(barh div 2));
    }   

    }
    
//draw text if any         
if (uiToggleOn && string_length(uiOnLabel)>0)//  draw yes....
 {
   draw_set_colour(uiOnLabelColor); 
   th=(barh-string_height(string_hash_to_newline(uiOnLabel))) div 2;
   draw_text(barx+5, bary+th+2, string_hash_to_newline(uiOnLabel));
 }
else if (uiToggleOn==false && string_length(uiOffLabel)>0)//  draw no....
 {
   draw_set_colour(uiOffLabelColor); 
   th=(barh-string_height(string_hash_to_newline(uiOffLabel))) div 2;
   draw_text(barx+barw-string_width(string_hash_to_newline(uiOffLabel))-5, bary+th+2, string_hash_to_newline(uiOffLabel));
 } 

  
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc    
  
  
  
  
  
    

       


/* */
/*  */
