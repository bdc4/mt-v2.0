/// @description keypressed event
var curk,stime;
if (uiMoving) exit;  //if moving ignore press

curk=other.uiTextValue;
if curk="\\#" then {curk="#"; } //stupid #

if object_get_name(uiFocusID.object_index) != "ui_editbox" {exit;}


if other.uiControlName="key"
     {
       with (uiFocusID)
           { keyboard_press=curk;     
             event_user(1);} //call keypress on editbox;
       if cap_lock=false && curState=1 
           {curState=0;  //reset shift      
            event_user(3);
           } 
     }  
else if other.uiControlName="back"
     {
       with (uiFocusID)
           { keyboard_press="back";     
             event_user(1); //backspace
           }
     }   
else if other.uiControlName="enter"
     {
       with (uiFocusID)
           { keyboard_press="enter";     
             event_user(1); //enter/next
           }
      event_user(6);  //enter pressed;     
     }       
else if other.uiControlName="shift"
     {
     //see if dbl-click
     stime=get_timer()-last_stime;
     if (stime)<500000 {cap_lock=true;curState=0;} else {cap_lock=false; last_stime=get_timer();}
     if curState=0 {curState=1;} else {curState=0;}
     event_user(3); //refresh;     
     }          
else if other.uiControlName="state"
     {
     if curState!=2 {curState=2;} else {if cap_lock {curState=1;} else {curState=0;}}
     event_user(3); //refresh;     
     }          
else if other.uiControlName="hide"
     {
            event_user(2); //hide
     }   
     

     

       

