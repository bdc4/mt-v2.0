/// @description refresh keys...like shift pressed

var fx,fy,fs,fl,fh,fc,ft,curchar;

fc=0;
for (fy=1;fy<=3;fy++)  //draw normal keys
  {
     ft=string_length(uiRow[fy]);  //# of keys        
     for(fx=1;fx<=ft;fx+=1)
        {   if curState=0 {curchar=string_char_at(uiRow[fy],fx);  }                               
                  else if curState=1 {curchar=string_char_at(uiRowShift[fy],fx);}                                 
                  else if curState=2 {curchar=string_char_at(uiRowAlt[fy],fx); }                                

            with (buttons[fc])
               {
                 uiTextValue=curchar;
                 uiMouseHandle=true; //safety on deactivate.
               }               
            fc+=1;         
        } //for each letter in the line string    
  }

  
back_key.uiMouseHandle=true; //safety on deactivate;    
enter_key.uiMouseHandle=true;
space_key.uiMouseHandle=true;
shift_key.uiMouseHandle=true;
state_key.uiMouseHandle=true;
hide_key.uiMouseHandle=true;
enter_key.uiTextValue=uiEnterStr;    

with (state_key) 
 { if other.curState != 2 {uiTextValue=other.uiStateStr;} 
   else {uiTextValue=other.uiStateStrAlt;}
   }


   
   
     

