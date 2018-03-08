if uiShowDialog
   {uiShowDialog=false;
    event_user(1);
    uiVisible=true;   
    uiAlpha=0.03;
    uiFadingSpeed=0.4;
    uiFadeIn=true;
    uiSetModal=true;
   }
   
if (uiSetModal) && (panelfocused==false)
     { event_user(3); //disable all controls underneath;
       panelfocused=true;
     }    
  else if (uiSetModal==false) && (panelfocused)
     {
      event_user(4);
      panelfocused=false;    
     }   
        

