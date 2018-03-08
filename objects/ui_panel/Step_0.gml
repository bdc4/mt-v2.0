//initialize state checking
if OldEnabled==-1 OldEnabled=uiEnabled;
if OldVisible==-1 OldVisible=uiVisible;

if (OldEnabled != uiEnabled)
    {
       OldEnabled=uiEnabled;                           
       if uiEnabled == false
            {  whatchanged=1;  //enabled flag
               event_user(1);  //save states and visible;                                                                             
            }
       else { whatchanged=1;
              event_user(2); //restore on uiEnabled = true;
            }    
    }

    //if visible flag changed....
    
if (OldVisible != uiVisible)
    {
       OldVisible=uiVisible;                           
       if uiVisible == false
            {  whatchanged=2;  //
               event_user(1);  //save states and visible;                                                                             
            }
       else { whatchanged=2;
              event_user(2); //restore on uiVisible = true;
            }    
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
     
    

