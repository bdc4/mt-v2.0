/// @description sin animation (2 pi/ runs continous)
/// @function sin animation 
/// @param 2 pi/ runs continous


//this is for animations that repeat like pulse/wobble/fading


with (EaseControl) do 
{
     if other.initvars    //first step
        {
        other.EaseStart=0;
        other.EaseEnd=2*pi;                                                                                        
        other.initvars=false;          
        other.KillEase=false; //don't destroy;
        
               
        } //if first step, we setup variables for movement;      
        
    switch (other.EaseKind)
      {
         case 3 :   uiAniWobble=uiWobble * (sin(other.EaseCurValue)); break; //wobble;
         case 2 :   uiAniPulse=uiPulse *  sin(other.EaseCurValue) ; break; //pulse;
         case 4 :   uiAniFading=uiFading * (sin(other.EaseCurValue)); break;  //fading;
         case 6 :    //draw glowing 
                      CurFading=(uiGlowing * (sin(other.EaseCurValue)));
                      //will draw in the draw event the glow...
                    break;  
      }
}        
  
               

event_user(1); //ease function

