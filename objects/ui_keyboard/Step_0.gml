 
if initkeys {
             initkeys=false;
             event_user(1);  //create button locations
             exit;
            } 
            
if uiKeyboardShow { uiKeyboardShow=false;
                    if uiVisible=false event_user(4); //show keyboard;
                    exit;
                  }                                  
if uiKeyboardHide { uiKeyboardHide=false;
                    if uiVisible event_user(2); //hide keyboard;
                    exit;
                  }              

if uiVisible=false exit;

if uiRefresh { uiRefresh=false;
               if uiFocusID==noone {event_user(2);exit;} //html bug
               if (object_get_name(uiFocusID.object_index) != "ui_editbox") //&& (isHiding=false)
                {event_user(2);}
                
             }   
     

