/// @description button pressed;

//show_message(other.uiControlName);

var fx;

uiDialogResult=-1;  //none default

switch (other.uiControlName)
 {
    case "button1": uiDialogResult=1; break;
    case "button2": uiDialogResult=2; break;
    case "button3": uiDialogResult=3; break;
    case "button4": uiDialogResult=4; break; 
 } //end switch   
 
 
uiFadeOut=true;
uiSetModal=false;
 
 
var evNum;
evNum=uiEventNum;
if uiEventObject != noone
// if object_exists(uiEventObject) then
  with (uiEventObject) 
   {if evNum>=0 event_user(evNum);}
   
   
 

   
   
 
 
 




