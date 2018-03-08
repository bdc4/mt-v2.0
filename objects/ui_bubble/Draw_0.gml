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

var ymargin,disptx,px,py,zx,zy,ymir,xmir;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     

disptx=uiTextValue;

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);




curZoomFactor=uiZoomFactor+uiAniPulse;
curAlpha=uiAlpha-uiAniFading;
curRot=uiAngle+uiAniWobble;


curLB.uiAniPulse=uiAniPulse;
curLB.uiAniFading=uiAniFading;



zx=0;zy=0;  
px=0;py=0;          


if curZoomFactor != 1
   {  zx =    (sprite_width - (sprite_width * curZoomFactor)) div 2 ;
      zy =    (sprite_height - (sprite_height * curZoomFactor)) div 2 ;         

   }
   
curLB.y=curLB.ystart+zy;
   

if (uiDrawBackColor) && (uiBubbleSprite==noone)
   {
    drawX=px;drawY=py;
    switch (uiBubblePos)
          {
           case 0  : drawY=y-sprite_height;y=ystart-sprite_height; break;
           case 2  : drawX-=sprite_width;x=xstart-sprite_width;break;
           case 3  : drawX-=sprite_width;drawY-=sprite_height;x=xstart-sprite_width;y=ystart-sprite_height;break;
          }       

    if (uiCustomDrawBack != noone)
         {
          script_execute(uiCustomDrawBack,x+zx, y+zy, x+zx+(sprite_width*curZoomFactor), y+zy+(sprite_height*curZoomFactor),uiBackColor,uiBackColor2);    
         }   
     else 
       {draw_roundrect_color_ext(x+zx+3, y+zy+3, x+zx+3+(sprite_width*curZoomFactor), y+zy+3+(sprite_height*curZoomFactor), uiRadiusX,uiRadiusY,uiBackColor2,uiBackColor2, false);   //fill background        
        draw_roundrect_color_ext(x+zx, y+zy, x+zx+(sprite_width*curZoomFactor), y+zy+(sprite_height*curZoomFactor), uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill        
       }
   } 

 
   

if uiBubbleSprite != noone
     {
     xmir=1;ymir=1;
     curRot=0;
     switch (uiBubblePos)
          {
           case 0  : py-=sprite_height;y=ystart-sprite_height; break;
           case 1  : ymir=-1; py+=sprite_height;zy*=-1; break;
           case 2  : ymir=-1;xmir=-1;py+=sprite_height;x=xstart-sprite_width;zx*=-1;zy*=-1; break;
           case 3  : xmir=-1;py-=sprite_height;x=xstart-sprite_width;y=ystart-sprite_height;zx*=-1;break;
          }    
     xmir=xmir*curZoomFactor;
     ymir=ymir*curZoomFactor;     
     draw_sprite_ext( uiBubbleSprite, uiSpriteIndex, drawX+px+zx,drawY+py+zy, (sprite_width/sprite_get_width(uiBubbleSprite))*xmir, (sprite_height/sprite_get_height(uiBubbleSprite))*ymir, curRot, image_blend, curAlpha );
     }                 
       
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   







/* */
/*  */
