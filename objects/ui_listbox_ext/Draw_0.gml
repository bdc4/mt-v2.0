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

var disptx,px,sel,numitems,fx,cury,th,sh,sw,surx,sury,visible_ytop,visible_ybot,sur_pos,ch;

event_inherited();

numitems=array_length_1d(items);

draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);


lineheight=string_height(string_hash_to_newline("XgpT"))*uiYscale  + uiLineSpacing;

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming   


th=lineheight;

//bottomline=((numitems*lineheight)-sprite_height) * -1;  //top drawy line for bottom clip.
     
   
if (!surface_exists(CurSurface)) {
    surx=ceil(sprite_width);
    sury=ceil(sprite_height+(maxLineHeight*2));  //max lineheight for one line item is 128 for now?
    fx=1; while (fx < surx) { fx *= 2}; surx=fx;  //make sure power of 2
    fx=1; while (fx < sury) { fx *= 2}; sury=fx;  //make sure power of 2  
    CurSurface = surface_create(surx,sury); 
};

surface_set_target(CurSurface);  
draw_clear_alpha(c_black, 0);
texture_set_interpolation(false);
sh=surface_get_height(CurSurface);   //get surface height

if uiDrawSquare { uiRadiusX=0;uiRadiusY=0;}


if uiDrawBackColor    //draw background
   {//draw the surface background 
    draw_roundrect_color_ext(0, 0, sprite_width, sh, uiRadiusX,uiRadiusY,uiBackColor,uiBackColor, false);   //fill
    draw_roundrect_color_ext(0, 0, sprite_width, sh, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, true);   //draw outline    
   } 
     
   
draw_set_halign(uiAlign);

cury=0;  //always draw from 0;
visible_ytop=drawy*-1;
visible_ybot=visible_ytop+sprite_height+1;  //clipping region for drawing bottom....
sur_pos=max(maxLineHeight-(drawy*-1),0); //surface y pos;

for (fx=0;fx<numitems;fx+=1)    //go through each item in the list;
{  
 if uiCustomDrawScript == -1
   {
     /////////////   STANDARD DRAWING   /////////////////////   
     if (cury)<(visible_ytop-maxLineHeight)   //if not visible then draw at alpha 0 at postion 0....
              { cury+=th
                sur_pos=cury-(visible_ytop-maxLineHeight);
              } 
     else if ((cury)<=visible_ybot) //if we are below bottom  and above top...we draw to surface....                      
               {          
                disptx=items[fx];        
                while (string_width(string_hash_to_newline(disptx+"X")) * uiXscale) > (sprite_width)   //clip strings if they are too long
                      { 
                         disptx=string_delete(disptx,string_length(disptx),1);
                         if string_length(disptx)<2 break;
                      }  
       
                if uiAlign==fa_left { px=5; } 
                 else if uiAlign==fa_middle {px=(sprite_width div 2); }
                   else if uiAlign==fa_right {px = sprite_width -5; } 

                draw_set_color(uiTextColor);  


                if (itemindex==fx) && (uiDrawHilite==true)       //if hilited item
                     {
                        draw_rectangle_color(0, sur_pos, sprite_width-1, sur_pos+th,uiHiliteBackColor,uiHiliteBackColor2,uiHiliteBackColor,uiHiliteBackColor2,false);   //fill hilite;
                        draw_set_color(uiHiliteColor);  //set text color  
                     }

                draw_text_transformed(px+uiLeftMargin,sur_pos+2,string_hash_to_newline(disptx),uiXscale,uiYscale,0);     
    
                if uiShowArrows draw_sprite(sprite_index,3, sprite_width - 40,sur_pos);
    
                if (itemindex!=fx) && uiDrawLines then  // draw lines between items
                        {
                             draw_set_color(uiBorderBackColor);
                             draw_line_width(0,sur_pos+th,sprite_width,sur_pos+th,1);    
                        }               
               cury+=th;
               sur_pos+=th;  //add to surface position;
             } //if visible
           else cury+=th;  //else continue and draw nothing.                                 
           itemspos[fx]=cury;  //set the hilite array...
                
                
   }  else //////////////////   CUSTOM SCRIPT DRAW   /////////////////////////
      { if itemindex==fx sel=true; else sel=false;
        if (cury)<(visible_ytop-maxLineHeight)   //if not visible then draw at alpha 0 at postion 0....
              { draw_set_alpha(0);  //don't draw stuff that's not visible.  we still need to get the variable heights, so that is why we draw alpha=0 lines....
                cury+=script_execute(uiCustomDrawScript,self.id,fx,0,0,th,sprite_width-2,items[fx],sel);     
                draw_set_alpha(uiAlpha);  
                sur_pos=cury-(visible_ytop-maxLineHeight);
              } 
          else if ((cury)<=visible_ybot) //if we are below bottom  and above top...we draw to surface....                      
               {
               ch=script_execute(uiCustomDrawScript,self.id,fx,0,sur_pos,th,sprite_width-2,items[fx],sel);
               cury+=ch;
               sur_pos+=ch;  //add to surface position;
               }
          else cury=cury+th;  //do nothing....                      
        itemspos[fx]=cury;  //list for selection
      }   
}  //for each item

if cury>=sprite_height noscroll=false; else noscroll=true;  //weather we scroll or not

//set bottomline when possible variable length custom drawing...
bottomline=(cury-sprite_height) * -1;  //top drawy line for bottom clip.

//draw bottom clip

texture_set_interpolation(true);
surface_reset_target();
draw_surface_part(CurSurface, 0,maxLineHeight,sprite_width,sprite_height,x,y);  //128 is the per clip region


//draw header with uiTextLabel

if uiDrawHeader
{
draw_set_color(uiBorderBackColor);  
draw_rectangle(x, y-th, x+sprite_width, y, false);   //fill
}


if uiDrawBackColor    //draw Border
   {  
    draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,uiBorderBackColor,uiBorderBackColor, true);   //draw outline         
   } 


//draw uiTextLabel centered.
draw_set_color(uiBorderColor);
px= x + (sprite_width div 2);
draw_set_halign(fa_center);
if uiTextLabel !="" draw_text_transformed(px,y-th+2,string_hash_to_newline(uiTextLabel),uiXscale,uiYscale,0);  

//draw scrolling arrows
if (noscroll==false) && (uiScrollArrows=true)  
   { curArrowPulse += curArrowSpeed;
     if curArrowPulse > 1 {curArrowSpeed *= -1;}
        else if curArrowPulse < 0.3 {curArrowSpeed *= -1;}          
     if drawy<0 draw_sprite_ext(sprite_index,5,x+sprite_width-40,y+2,1,1,0,uiScrollColor,curArrowPulse);
     if drawy>bottomline draw_sprite_ext(sprite_index,4,x+sprite_width-40,y+sprite_height-30,1,1,0,uiScrollColor,curArrowPulse);              
   }


//if (surface_exists(CurSurface)) {surface_free(CurSurface);}

draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   



/* */
/*  */
