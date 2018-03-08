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

var disptx,px,py,sel,numitems,fx,cury,tw,sh,sw,surx,sury,visible_ytop,visible_ybot,sur_pos,ch,sprx,spry,sprxscale,spryscale,sprrot,curImageBlend,curAlpha,autoPos,numSprites,curSprite;

event_inherited();

numitems=array_length_1d(items);

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   


tw=uiItemWidth;

//bottomline=((numitems*lineheight)-sprite_height) * -1;  //top drawy line for bottom clip.
curImageBlend=uiImageBlend;
curAlpha=uiAlpha;
     
   
if (!surface_exists(CurSurface)) {
    sury=ceil(sprite_height);
    surx=ceil(sprite_width+(uiItemWidth*2));  //max lineheight for one line item is 128 for now?
    fx=1; while (fx < surx) { fx *= 2}; surx=fx;  //make sure power of 2
    fx=1; while (fx < sury) { fx *= 2}; sury=fx;  //make sure power of 2  
    CurSurface = surface_create(surx,sury); 
};

surface_set_target(CurSurface);  
draw_clear_alpha(c_black, 0);
texture_set_interpolation(false);
sw=surface_get_width(CurSurface);   //get surface height

if uiDrawSquare { uiRadiusX=0;uiRadiusY=0;}

if uiDrawBackColor    //draw background
   {//draw the surface background 
    draw_roundrect_color_ext(0, 0, sw, sprite_height, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill
    draw_roundrect_color_ext(0, 0, sw, sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor,true);   //draw outline    
   } 
     
   
draw_set_halign(uiAlign);
numSprites=array_length_1d(sprites);

cury=0;  //always draw from 0;
visible_ytop=(drawy+uiLeftMargin)*-1;
visible_ybot=visible_ytop+sprite_width+1;  //clipping region for drawing bottom....
sur_pos=max(uiItemWidth-((drawy+uiLeftMargin)*-1),0); //surface y pos;

autoPos=visible_ytop;                 //auto selection pos
if uiAutoSelect {itemindex=-1;}

//zoomx=1;

for (fx=0;fx<numitems;fx+=1)    //go through each item in the list;
{  
 if uiCustomDrawScript == -1
   {
     /////////////   STANDARD DRAWING   /////////////////////   
     if (cury)<(visible_ytop-uiItemWidth)   //if not visible then draw at alpha 0 at postion 0....
              { cury+=tw
                sur_pos=cury-(visible_ytop-uiItemWidth);
//                zoomx +=1;  //for zoomindex feature.
              } 
     else if ((cury)<=visible_ybot) //if we are below bottom  and above top...we draw to surface....                      
               {          
                if uiAutoSelect {if (cury > autoPos) && (itemindex==-1) itemindex=fx};
                disptx=items[fx];        
                while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (uiItemWidth)   //clip strings if they are too long
                      { 
                         disptx=string_delete(disptx,string_length(disptx),1);
                         if string_length(disptx)<2 break;
                      }  
 

               draw_set_color(uiTextColor); 
                if (itemindex==fx) && (uiDrawHilite==true)       //if hilited item
                     {
                        draw_rectangle_color(sur_pos,0, sur_pos+tw,sprite_height-1,uiHiliteBackColor,uiHiliteBackColor2,uiHiliteBackColor,uiHiliteBackColor2,false);   //fill hilite;
                        draw_set_color(uiHiliteColor);  //set text color  
                     }

                     
                //draw sprite if exists;
                if numSprites>=fx
                   {if sprite_exists(sprites[fx])
                     {        sprxscale=uiSpriteScale;
                              spryscale=uiSpriteScale; 
//                              if uiZoomIndex!= -1 { if uiZoomIndex==(fx-zoomx) { sprxscale *=1.3; spryscale *= 1.3} }
                              if uiSpriteScale==0 { uiSpriteAlign=fa_left; uiSpriteAlignV=fa_top;}  //if auto-fit then no alignment.
                              px=0;py=0; 
                              if uiSpriteAlign==fa_left { sprx=5; } 
                                 else if uiSpriteAlign==fa_center {sprx= (uiItemWidth- (sprite_get_width(sprites[fx])*uiSpriteScale)) div 2; }
                                 else if uiSpriteAlign==fa_right {sprx =uiItemWidth - (sprite_get_width(sprites[fx])*uiSpriteScale); } 
                        
                              if uiSpriteAlignV==fa_top { spry=5; }
                                 else if uiSpriteAlignV==fa_middle { spry=( ((sprite_height - (sprite_get_height(sprites[fx]))*uiSpriteScale)) div 2);}  //center text vertically;
                                 else if uiSpriteAlignV==fa_bottom { spry=sprite_height - (sprite_get_height(sprites[fx])*uiSpriteScale); }
                                     
                              if uiSpriteScale==0 { 
                                                    sprxscale= uiItemWidth / (sprite_get_width(sprites[fx]));
                                                    spryscale= sprite_height / (sprite_get_height(sprites[fx]));
                                                    sprx=px+ (sprite_get_xoffset(sprites[fx])* sprxscale);
                                                    spry=py+ (sprite_get_yoffset(sprites[fx])* spryscale);  
                                                  }                              
                              //sprrot=uiSpriteAngle;
                              draw_sprite_ext(sprites[fx],uiSpriteIndex,sur_pos+sprx,spry,sprxscale,spryscale,0,curImageBlend,curAlpha);         
                                       
                    }   
                }       
                
                
                px=0;      
                if uiAlign==fa_left { px=5; } 
                   else if uiAlign==fa_center {px=( uiItemWidth) div 2; }
                   else if uiAlign==fa_right {px = uiItemWidth- 5; } 

                py=0;
                if uiAlignV==fa_top { py=5; } 
                 else if uiAlignV==fa_middle {py=(sprite_height div 2); }
                   else if uiAlignV==fa_bottom {py = sprite_height-string_height(string_hash_to_newline("Xypg")); } 

                   
              
                draw_text_transformed(sur_pos+2+px,py,string_hash_to_newline(disptx),uiXscale,uiYscale,0);     
    
    
                if (itemindex!=fx) && uiDrawLines then  // draw lines between items
                        {
                             draw_set_color(uiBorderBackColor);
                             draw_line_width(sur_pos+tw,0,sur_pos+tw,sprite_height,1);    
                        }               
               cury+=tw;
               sur_pos+=tw;  //add to surface position;
             } //if visible
           else cury+=tw;  //else continue and draw nothing.                                 
           itemspos[fx]=cury;  //set the hilite array...
                
                
   }  else //////////////////   CUSTOM SCRIPT DRAW   /////////////////////////
      { 
        if uiAutoSelect {if (cury > autoPos) && (itemindex==-1) itemindex=fx};
        if itemindex==fx sel=true; else sel=false;
        curSprite=-1;
        if numSprites>=fx {if sprite_exists(sprites[fx]) curSprite=sprites[fx];}

        if (cury)<(visible_ytop-uiItemWidth)   //if not visible then draw at alpha 0 at postion 0....
              { draw_set_alpha(0);  //don't draw stuff that's not visible.  we still need to get the variable heights, so that is why we draw alpha=0 lines....
                cury+=script_execute(uiCustomDrawScript,self.id,fx,0,0,sprite_height,tw,items[fx],sel,curSprite);     
                draw_set_alpha(uiAlpha);  
                sur_pos=cury-(visible_ytop-uiItemWidth);
              } 
          else if ((cury)<=visible_ybot) //if we are below bottom  and above top...we draw to surface....                      
               {
               ch=script_execute(uiCustomDrawScript,self.id,fx,sur_pos,0,sprite_height,tw,items[fx],sel,curSprite);
               cury+=ch;
               sur_pos+=ch;  //add to surface position;
               }
          else cury=cury+tw;  //do nothing....                      
        itemspos[fx]=cury;  //list for selection 
      }   
}  //for each item

if cury>=sprite_width noscroll=false; else noscroll=true;  //weather we scroll or not

//set bottomline when possible variable length custom drawing...
//
if uiLeftMargin==0 {bottomline=(cury-(sprite_width)) * -1; } //top drawy line for bottom clip.
   else {bottomline=(cury-(sprite_width)+(uiItemWidth)) * -1;}  //top drawy line for bottom clip.
//draw bottom clip

texture_set_interpolation(true);
surface_reset_target();
draw_surface_part(CurSurface, uiItemWidth,0,sprite_width,sprite_height,x,y);  //128 is the per clip region


//draw header with uiTextLabel

if uiDrawHeader
{
//draw_set_color(uiBorderBackColor);  
//draw_rectangle(x, y-th, x+sprite_width, y, false);   //fill
}


if uiDrawBackColor    //draw Border
   {  
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, true);   //draw outline         
   } 


//draw uiTextLabel centered.
draw_set_color(uiBorderColor);
px= x + (sprite_width div 2);
draw_set_halign(fa_center);
if uiTextLabel !="" draw_text_transformed(px,y-string_height(string_hash_to_newline("Xypg"))+2,string_hash_to_newline(uiTextLabel),uiXscale,uiYscale,0);  

//draw scrolling arrows

if (noscroll==false) && (uiScrollArrows=true)  && (uiEnabled)  
   { curArrowPulse += curArrowSpeed;
     if curArrowPulse > 1 {curArrowSpeed *= -1;}
        else if curArrowPulse < 0.3 {curArrowSpeed *= -1;}          
     if drawy<0 draw_sprite_ext(sprite_index,3,x+30, y+sprite_height-20,1,1,180,uiScrollColor,curArrowPulse);
     if drawy>bottomline draw_sprite_ext(sprite_index,3,x+sprite_width-30,y+sprite_height-52,1,1,0,uiScrollColor,curArrowPulse);              
   }


//if (surface_exists(CurSurface)) {surface_free(CurSurface);}


draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   


/* */
/*  */
