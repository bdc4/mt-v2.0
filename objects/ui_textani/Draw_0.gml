var tw,dc,c1, stepx,curp, fx,px,ymargin, curx, cury, angx, angy, ta;

event_inherited();
if (uiZoomFactor==0.1) || (uiVisible==false) exit;  //for zooming     


draw_set_font(uiFont);
draw_set_halign(uiAlign);
draw_set_valign(uiAlignV);



draw_set_color(uiTextColor);

tw=string_length(CurDispText);
if tw==0 exit;

if CurCanDraw==false exit; //arrays not setup yet....

if CurAnimated 
{
     if uiWobble != 0 
          {  
          CurWobble += uiWobbleSpeed;
          if CurWobble > uiWobble  {uiWobbleSpeed *= -1;}                                       
          else if CurWobble < (uiWobble * -1)  {uiWobbleSpeed *= -1;}
          }    
          
     if uiPulse != 0
         {
          CurPulse += uiPulseSpeed;
          if CurPulse > 1+(uiPulse) {uiPulseSpeed *= -1;}
          else if CurPulse < 1-(uiPulse) {uiPulseSpeed *= -1;}          
         } 
         
     if uiFading != 0
         {
          CurFading += uiFadingSpeed;
          if CurFading > 1 {uiFadingSpeed *= -1;}
          else if CurFading < 1-(uiFading) {uiFadingSpeed *= -1;}          
         }             
  

  

    
}     //if has animated things like pulse, fading, etc...
    

if uiFadeOut CurFading=(1-uiAlpha);
  
if CurInMotion      //if moving along a path...
 {
    stepx= 1 / tw ; 
    curp=path_position+(uiPathSpeed/10000);

    angx = path_get_x(path_index,curp-0.0005);
    angy = path_get_y(path_index,curp-0.0005);
  
         
    for (fx=CurStartIndex;fx<=tw;fx+=1)
     {
      curx=path_get_x(path_index,curp);
      cury=path_get_y(path_index,curp);
      dc = uiCArray[fx];
      curp += (string_width(string_hash_to_newline(dc))*uiCArrayZoom[fx]) / path_get_length(path_index);
      angx=path_get_x(path_index,curp);
      angy=path_get_y(path_index,curp);
      ta = point_direction(curx,cury,angx, angy); //get angle
      uiCArrayXpos[fx]=curx;
      uiCArrayYpos[fx]=cury;
      uiCArrayRot[fx]=ta;
     }
    
 }  else //nopath assigned
 {     
       ymargin= (sprite_height - (string_height(string_hash_to_newline(CurDispText)) * uiYscale)) div 2 ;
       px=x;
       if uiAlignAni==fa_left { px=x +5; } 
         else if uiAlignAni==fa_center {px= x + (( sprite_width-(string_width(string_hash_to_newline(CurDispText)) * uiYscale)) div 2); }
            else if uiAlignAni==fa_right {px = x + sprite_width - (string_width(string_hash_to_newline(CurDispText)) * uiYscale) -8; } 
       curp=px;
       for (fx=CurStartIndex;fx<=tw;fx+=1)
            {
                   dc = uiCArray[fx];
                   uiCArrayXpos[fx]=curp;
                   uiCArrayYpos[fx]=y+ymargin;
                   curp += ceil(string_width(string_hash_to_newline(dc))*uiCArrayZoom[fx]);
            } 
 
 }  //no path assigned;
 
 
 
 
if uiTextEffect>=0
{ 
if uiTextEffect==0  //do same on all text;
    { 
      for (fx=1;fx<=tw;fx+=1)  // apply to all characters same;
       {  if uiWobble != 0 uiCArrayRot[fx]+=CurWobble;
          if uiFading != 0 uiCArrayAlpha[fx]=CurFading;
          if uiPulse != 0 uiCArrayZoom[fx]=CurPulse;
       }  
    }  else
if uiTextEffect==1  //alternate on each char;
    { 
      for (fx=1;fx<=tw;fx+=2)  // apply to all characters same;
       {  if uiWobble != 0 uiCArrayRot[fx]=CurWobble;
          if uiFading != 0 uiCArrayAlpha[fx]=CurFading;
          if uiPulse != 0 uiCArrayZoom[fx]=CurPulse;
       }  
      for (fx=2;fx<=tw;fx+=2)  // apply to all characters same;
       {  if uiWobble != 0 uiCArrayRot[fx]=CurWobble * -1;
          if uiFading != 0 uiCArrayAlpha[fx]=1+ (uiFading -CurFading);
          if uiPulse != 0 uiCArrayZoom[fx]=1+(1-CurPulse);
       }  
       
    } else
if uiTextEffect==2  //alternate on each word on space;
    { c1=1;
      for (fx=1;fx<=tw;fx+=1) 
       { 
        if uiCArray[fx]=" " c1=c1*-1;  //if space then alternate....
        if c1>0
         {
          if uiWobble != 0 uiCArrayRot[fx]=CurWobble;
          if uiFading != 0 uiCArrayAlpha[fx]=CurFading;
          if uiPulse != 0 uiCArrayZoom[fx]=CurPulse;
         } else 
         {  if uiWobble != 0 uiCArrayRot[fx]=CurWobble * -1;
          if uiFading != 0 uiCArrayAlpha[fx]=CurFading;
          if uiPulse != 0 uiCArrayZoom[fx]=1+(1-CurPulse);
         }  
       }
     } else
if uiTextEffect==3  //Type Keypress effect;
    { 
      if (CurAniCounter mod (room_speed div uiTypeSpeed))==1 CurTypeIndex+=1;
      for (fx=1;fx<=tw;fx+=1)  // apply to all characters same;
       {   if fx>=CurTypeIndex {uiCArrayAlpha[fx]=0} else {uiCArrayAlpha[fx]=1;}
       }
    }
    
}    
  
//use alpha for keyboard typewriter effect...


 for (fx=CurStartIndex;fx<=tw;fx+=1)  //draw each character individually...
     {
      c1=uiCArrayColor[fx];
      if uiFadeOut uiCArrayAlpha[fx]=uiAlpha;
      draw_text_transformed_color(uiCArrayXpos[fx],uiCArrayYpos[fx],string_hash_to_newline(uiCArray[fx]),uiCArrayZoom[fx], uiCArrayZoom[fx], uiCArrayRot[fx], c1, c1, c1, c1, uiCArrayAlpha[fx]); 
     } 
 
draw_set_alpha(backalpha);  //restore alpha (in case of fadeout, etc    
 

