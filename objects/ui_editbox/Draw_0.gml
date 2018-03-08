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

var ymargin,disptx,px,tmpc,tmpch,curcol;


event_inherited();

if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     


draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(fa_top);

if not isFocused {start_pos=0;cursor_pos=-1;set_mouse_pos=-1;}


disptx=string_copy(uiTextValue,start_pos+1,cursor_pos-start_pos);   
disptx=string_replace_all(disptx,"#","\\#")

while (string_width(string_hash_to_newline(disptx)) > sprite_width-string_width(string_hash_to_newline("X"))-5)
  {
    start_pos+=1;
    disptx=string_copy(uiTextValue,start_pos+1,cursor_pos+1);
    disptx=string_replace_all(disptx,"#","\\#")
  }  



px=0;
tmpc=start_pos;  
disptx="";
while (px<(sprite_width-string_width(string_hash_to_newline("X"))-5)) && (tmpc<=string_length(uiTextValue))
     {
       tmpch=string_char_at(uiTextValue,tmpc+1);
       disptx += tmpch;
       if tmpch="#" tmpch="\\#";   //stupid # symbol
       px += string_width(string_hash_to_newline(tmpch));          
       tmpc+=1;      
       
       //check mouse cursor set
       if set_mouse_pos>0 { if px>=set_mouse_pos then
                                              {cursor_pos=tmpc-1;
                                               set_mouse_pos=-1; //reset mouse cursor;
                                              }
                          } 
     }    

     
if set_mouse_pos>0 {cursor_pos=tmpc-1;set_mouse_pos=-1;};  //if mouse cursor set.          

if uiPasswordChar != "" then disptx = string_repeat(uiPasswordChar,string_length(disptx))

if isFocused curcol=uiFocusColor else 
             curcol=uiBackColor;  
              
              


//draw_text_transformed(5,5,string(cursor_pos),uiXscale,uiYscale,0);             

draw_roundrect_color_ext(x, y, x+sprite_width, y+sprite_height, uiRadiusX,uiRadiusY,curcol,curcol, false);   //fill

disptx=string_replace_all(disptx,"#","\\#")
ymargin= (sprite_height - (string_height(string_hash_to_newline(disptx)) * uiYscale)) div 2 ;



if uiAlign==fa_left { px=x +5; } 
 else if uiAlign==fa_middle {px= x + (sprite_width div 2); }
   else if uiAlign==fa_right {px = x+sprite_width -5; } 
 
if isFocused draw_set_color(uiFocusTextColor) else 
             draw_set_color(uiTextColor);  

draw_text_transformed(px,y + ymargin,string_hash_to_newline(disptx),uiXscale,uiYscale,0);   

disptx=string_replace_all(disptx,"\\#","#"); //stupid # symbol again

//draw cursor
if isFocused 
 {
   px=0;
   tmpc=start_pos;
   while tmpc<cursor_pos
     {
       tmpch=string_char_at(disptx,tmpc-start_pos+1);  //crazy and stupid #
       if tmpch="#" tmpch="\\#";
       px += string_width(string_hash_to_newline(tmpch));   
       tmpc+=1; 
     }
     curCursorPulse += curCursorSpeed;
     if curCursorPulse > 1 {curCursorSpeed *= -1;}
        else if curCursorPulse < 0.3 {curCursorSpeed *= -1;}          
     tmpc=draw_get_alpha();   
     draw_set_alpha(curCursorPulse);              
     draw_set_color(uiCursorColor);
     if px>sprite_width-10 px=sprite_width - uiCursorWidth;
     draw_rectangle(x+px+5,y,x+px+uiCursorWidth,y+sprite_height,false);
     draw_set_alpha(tmpc);     
}
      

if uiTextLabel !=""     //if label
    {
       px=x-string_width(string_hash_to_newline("X"));  //10 pixels prior to editbox;    
       draw_set_color(uiLabelTextColor);
       draw_set_halign(fa_right);
       ymargin= (sprite_height - (string_height(string_hash_to_newline(uiTextLabel)) * uiYscale)) div 2 ;
       draw_text(px,y+ymargin,string_hash_to_newline(uiTextLabel));            
    }







draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc   


/* */
/*  */
