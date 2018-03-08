if uiMemo !="" then  //memo set so we break apart string to items list
   {  event_user(1); 
      uiMemo="";  //resets so only called once.
   }



if flicked != 0 then //we need to flick...
 {
 if rubberbanding==false
   {
    drawy+=flicked * 0.10;
    flicked=flicked * 0.90;
   } else flicked=0;
 if abs(flicked)<=5 flicked=0;  
 }

 
if (mouse_move==false && uiCredits)  //scroll credits;
   {
     drawy=drawy- 0.6;
     if drawy<=bottomline then 
        {drawy=0;
         exit;
        }        
   } 
 
if (mouse_move==false && drawy>0)
    { if rubberbanding ==false {rubberbanding = true;                     
                                bandstep = ((drawy) div 6) +2 ;
                                }
      if drawy>0 drawy-=bandstep;
      if drawy <=0 then { drawy=0;
                          rubberbanding=false;
                          flicked=0;
                        }  
    } 
    
if (mouse_move==false && drawy<bottomline && noscroll=false)
    {    
       if rubberbanding ==false {rubberbanding = true;                     
                                 bandstep =abs( ( (drawy-bottomline) div 6))+2;
                                }
       if drawy<bottomline drawy+=bandstep;
       if drawy>=bottomline then 
                       { 
                        drawy=bottomline;
                        rubberbanding=false;
                        flicked=0;
                       } 
   
    } 

if (drawy< (bottomline-(sprite_height div 3)) && mouse_move) event_user(0);
if (drawy> (sprite_height div 3) && mouse_move) event_user(0);                               

