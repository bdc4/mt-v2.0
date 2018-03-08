/// @description animation for ONCE animation (popup...etc)
/// @function animation for ONCE animation 
/// @param popup...etc


with (EaseControl) do 
{
     if other.initvars    //first step
        {
        other.EaseStart=0;
        other.EaseEnd=100;   //100% ease control;                                                                                      
        other.initvars=false;          
        other.KillEase=true; //destroy;                       
        } //if first step, we setup variables for movement;      
        
    switch (other.EaseKind)
      {
         case 7 :  //popup
                   uiAniPulse=max(other.EaseCurValue-100,-55) / 100;                           
                   break;           
         case 8 :  //popdown
                   uiAniPulse=(min(other.EaseCurValue,60)/100)*-1;
                   uiAniFading=(other.EaseCurValue)/100;
                   break;           
         case 9 :  //hover zoom in
                   if isHovering 
                      {uiAniPulse=(uiHoverInfo-1)*(other.EaseCurValue/100);}
                   else {
                         unAniPulse=0;
                         EaseDone=true; //kill stop
                        } 
                   break;                              
         case 10 :  //hover zoom out
                   if isHovering==false 
                      {uiAniPulse=((uiHoverInfo-1)*((100-other.EaseCurValue)/100));}
                   else {
                         unAniPulse=0;
                         EaseDone=true; //kill stop
                        } 
                   break;                              
      }
}        
  
               

event_user(1); //ease function

if EaseDone
  {
  with (EaseControl) do 
     {
         switch (other.EaseKind)
         {
         case 7 :  //popup
                   uiAniPulse=0;
                   break;           
         case 8 :  //popdown
                   uiAniPulse=0;
                   uiAniFading=0;
                   uiVisible=false;
                   break;                              
         }
     } //with
   } //if finished  


