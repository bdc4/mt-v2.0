if (StartEase==false) exit;        //leave if not inited
if (EasePause) {   //if paused then reset animation to 0
                with (EaseControl)
                 { uiAniPulse=0;
                   uiAniWobble=0;
                   uiAniFading=0;
                 }  
                exit;  //do nothing until ready to start or if we're paused
               } 
if (EaseControl.uiVisible==false)  && (EaseControl.uiMoving==false) exit; //leave if uiVisible=false;              


switch (EaseKind)
  {
     case 0:  //movement
              event_user(3);  //call animation
              break;              
     case 2:  //pulse
              event_user(4);  //call sin animation
              break;                            
     case 3:  //wobble
              event_user(4);  //call sin animation
              break;              
     case 4:  //fading
              event_user(4);  //call sin animation
              break;              
     case 5:  //fading
              event_user(5);  //call sparkle
              break;              
     case 6:  //glowing
              event_user(4);  //call sin animation
              break;   
     case 7:  //Popup
              event_user(6);  //call single animation
              break;   
     case 8:  //PopDown
              event_user(6);  //call single animation
              break;                              
     case 9:  //Hover Zoom
              event_user(6);  //call single animation
              break;                              
     case 10:  //Hover Zoom Out
              event_user(6);  //call single animation
              break;                              
                            
  }
  
  
if (EaseDone)
     { if (KillEase) { EaseControl.uiMoving=false; instance_destroy();}  //kill by default
          else {
                EaseCurTime=EaseStart;
                EaseDone=false;     
                altdir = altdir *-1;  //for animations that alternate     
               }     
     } 











