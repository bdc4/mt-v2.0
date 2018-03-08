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

var ymargin,disptx,px,py,bx,by,fx,yratio,drawbutdown,sprx,spry,sprW,sprH,sprxscale,spryscale,sprrot,curAlpha,curImageBlend,curZoomFactor,hoverEffect,curSprite,curIndex,xpulse,ypulse;

event_inherited();

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   


curAlpha=uiAlpha;
curImageBlend=uiImageBlend;
curZoomFactor=uiZoomFactor;



disptx=uiTextValue;

     

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(uiAlignV);



curZoomFactor +=uiAniPulse;   
curZoomFactorX=curZoomFactor;
curZoomFactorY=curZoomFactor;       


curAlpha -=uiAniFading;





px=x;
py=y;
sprrot=0;

//determine state of button
drawbutdown=false;
if (uiButtonState==1 || drawpress) then drawbutdown=true;
if (drawbutdown==false) {bx=0;by=0;} else {bx=uiDownOffset;by=uiDownOffset;};  

curSprite=uiButtonSprite;
curIndex=uiSpriteIndex; 


if drawbutdown==false {if isHovering==false curImageBlend=c_white; }
                 else {
                       //if uiDownBlend==true {curImageBlend=uiBackColor;} else {curImageBlend=c_white;}
                       curImageBlend=uiBackColor;
                       if uiButtonSpriteDown>=0 {curSprite=uiButtonSpriteDown;
                                                 curIndex=uiSpriteIndexDown; } 
                      }                           

                       
                      
                                   
if curZoomFactor != 1
   {  curZoomFactor = floor(curZoomFactor*100) / 100; 
      curZoomFactorX=curZoomFactor;
      curZoomFactorY=curZoomFactor;  
      if uiPulseJello    
             { if curZoomFactor >= 1  {curZoomFactorX=curZoomFactor;
                                       curZoomFactorY=1-(curZoomFactor-1);
                                      }
               else                   {curZoomFactorY=1+(1-curZoomFactor);
                                       curZoomFactorX=(curZoomFactor);
                                      }    
             }  
      image_xscale = uiOrigXscale * (curZoomFactorX);
      image_yscale = uiOrigYscale * (curZoomFactorY);
      px = x - ( ( ( curZoomFactorX * uiOrigWidth) - uiOrigWidth) div 2 );
      py = y - ( ( ( curZoomFactorY * uiOrigHeight) - uiOrigHeight) div 2 );           
   } else //if no zoom
      {image_xscale = uiOrigXscale;
       image_yscale = uiOrigYscale  
       curZoomFactorX=1;
       curZoomFactorY=1;                
      }     
       
  
      
sprH=sprite_height*uiBackScale;
sprW=sprite_width*uiBackScale;      

if uiDrawBackColor  //if we drawing background buttons then check uiBackScale (shrinking) 
    {
    px+=(sprite_width - sprW) / 2;
    py+=(sprite_height - sprH) / 2;       
    }

if (uiDrawBackColor && uiButtonState==0 && uiDrawOutline==false)  //if draw background and state = up.
   {
    draw_roundrect_color_ext(px+3, py+3, px+sprW+3, py+sprH+3,uiRadiusX,uiRadiusY,uiShadowColor,uiShadowColor,false);   //fill
   } 
   
 
   
if (uiDrawBackColor)  
   {
    draw_set_color(uiBackColor);  
    if uiBackColor2==0 uiBackColor2=uiBackColor;
    if (drawbutdown==false)
       draw_roundrect_color_ext(px+bx, py+by, px+sprW+bx, py+sprH+by,  uiRadiusX,uiRadiusY,uiBackColor,uiBackColor2,uiDrawOutline);   //fill
       else draw_roundrect_color_ext(px+bx, py+by, px+sprW+bx, py+sprH+by, uiRadiusX,uiRadiusY, uiDownColor,uiDownColor,uiDrawOutline);   //fill
   } 
   
if uiFlashButton then
   {
   uiFlashCounter +=1;
   fx = room_speed/30;
  if (uiFlashCounter mod (5*fx)) < (3*fx)
        {
           draw_roundrect_color_ext(px+bx, py+by, px+sprW+bx, py+sprH+by,uiRadiusX,uiRadiusY,uiDownColor,uiDownColor, false);   //fill
        }             
   }    

sprxscale=uiSpriteScale;
spryscale=uiSpriteScale; 

      
if curSprite>=0 then
   {
         if uiSpriteScale==0 { uiSpriteAlign=fa_left; uiSpriteAlignV=fa_top;}  //if auto-fit then no alignment.
     
         if uiSpriteAlign==fa_left { sprx=px; } 
            else if uiSpriteAlign==fa_center {sprx= px + ((sprite_width - (sprite_get_width(curSprite)*uiSpriteScale)) div 2); }
            else if uiSpriteAlign==fa_right {sprx = px+sprite_width - (sprite_get_width(curSprite)*uiSpriteScale); } 

         if uiSpriteAlignV==fa_top { spry=py; }
            else if uiSpriteAlignV==fa_middle { spry=py + ((sprite_height - (sprite_get_height(curSprite)*uiSpriteScale)) div 2);}  //center text vertically;
            else if uiSpriteAlignV==fa_bottom { spry=py +sprite_height - (sprite_get_height(curSprite)*uiSpriteScale); }
                
         if uiSpriteScale==0 { 
                               sprxscale= sprite_width / (sprite_get_width(curSprite));
                               spryscale= sprite_height / (sprite_get_height(curSprite));
                               sprx=px+ (sprite_get_xoffset(curSprite)* sprxscale);
                               spry=py+ (sprite_get_yoffset(curSprite)* spryscale);  
                             }                              
         sprrot=uiSpriteAngle + uiAniWobble;
         sprx=sprx+bx;
         spry=spry+by; 
         if (uiEnabled==false) || (uiMouseHandle==false) {curAlpha=draw_get_alpha();}
         draw_sprite_ext(curSprite,curIndex,sprx,spry,sprxscale,spryscale,sprrot,curImageBlend,curAlpha);         
                  
   }   
   

   
//draw button text if applicable...   

if uiTextTrim 
{  
 while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width)
 { 
    disptx=string_delete(disptx,string_length(disptx),1);
    if string_length(disptx)<2 break;  //failsafe
 }
} 

  
 
if uiAlign==fa_left { px=px +5; } 
// else if uiAlign==fa_center {px= px + ( (sprite_width -(string_width(disptx) *curZoomFactor))  div 2); }
 else if uiAlign==fa_center {px= px + (sprW  div 2); }
     else if uiAlign==fa_right {px = px + sprW -5; } 

if uiAlignV==fa_top { py= py+5; }
 else if uiAlignV==fa_middle { py=py+(sprH div 2) ;}  //center text vertically;
    else if uiAlignV==fa_bottom { py=py+sprH -5};
   
    
draw_set_color(uiTextColor);  
                 

if uiTextFixedX != -1 {px=x+bx+uiTextFixedX;}
if uiTextFixedY != -1 {py=y+by+uiTextFixedY;}

if disptx != "" 
{
    if uiTextFixed == false
      {draw_text_transformed(px+bx,py+by,string_hash_to_newline(disptx),uiXscale*curZoomFactorX,uiYscale*curZoomFactorY,sprrot);}
    else
      {draw_text(px+bx,py+by,string_hash_to_newline(disptx));}
}      

         
if (uiTouchKey) && (drawbutdown)  //draw a big button above press
      {
        var kx,ky,kw,kh,ks;
        kx=x-5;
        ky=y-70;
        kw=sprite_width+10;
        kh=70;
        draw_roundrect_color_ext(kx, ky, kx+kw, ky+kh,uiRadiusX,uiRadiusY,uiShadowColor,uiShadowColor,false);   //fill
        draw_set_color(uiBackColor);  
        if uiBackColor2==0 uiBackColor2=uiBackColor;
        draw_roundrect_color_ext(kx, ky, kx+kw, ky+kh,uiRadiusX,uiRadiusY,uiDownColor,uiDownColor,uiDrawOutline);   //fill
        draw_set_color(uiTextColor);  
        kx=kx + ((sprite_width+10)  div 2);
        draw_text_transformed(kx,ky+(kh div 2),string_hash_to_newline(disptx),1.5,1.5,0);     
               
      }                    
     

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   



/* */
/*  */
