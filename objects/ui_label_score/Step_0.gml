event_inherited();


if uiSetScore != -1  //has been changed
      {
       lsvalue=uiSetScore;    //where we going to...
       lsdelta=lsvalue-lscurval;       
       if lsdelta<0 lsinc=uiScoreInc*-1; else lsinc=uiScoreInc;  //set increment
       uiSetScore=-1;  //reset flag
      }

if lsdelta != 0 
     {lscurval+=lsinc;  //up or down
      lsdelta=lsvalue-lscurval;
      ischanging=true;
      if abs(lsvalue-lscurval)<abs(lsinc) {lsdelta=0;
                                           lscurval=lsvalue;
                                           ischanging=false;
                                          }                                             
     }
     
if inAnimation
    { if lscurval=lsvalue  then
       {
        if (lsanimated==true) then
                      {   with (ui_ani_control)  //hold animation objects
                              {  if EaseControl==other.id {EasePause=true;} }    
                          lsanimated=false;   
                      }   
       }
      else {  //we need to re-animate if animated!
            if (lsanimated==false) then
                      {   with (ui_ani_control)  //reset animation objects
                              {  if EaseControl==other.id {EasePause=false;} }    
                          lsanimated=true;   
                      }
           }              
    } //if we animate, we do it only when we are moving....       
     
      
lsdisnum=lscurval;
                  
uiTextValue=string_format(lsdisnum,uiScoreLength,uiScoreDec);      

lseffectcount+=1;

if (ischanging) && (lseffectcount>uiEffectDelay)
   {           
       if uiEffectAbove!=-1 effect_create_above(uiEffectAbove,x+irandom(sprite_width),y+irandom(sprite_height),1,uiEffectColor);
       if uiEffectBelow!=-1 effect_create_below(uiEffectBelow,x+irandom(sprite_width),y+irandom(sprite_height),1,uiEffectColor);
       lseffectcount=0; //reset delay counter;        
   }   
                                                    


      
      


