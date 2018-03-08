var i,otherbuts;

if uiIsToggle { if uiButtonState==0 uiButtonState=1; else uiButtonState=0; }

if uiButtonGroup>0
    {
          for (i = 0; i < instance_number(ui_button_ani); i += 1)
             {  otherbuts=instance_find(ui_button_ani,i); 
                if (otherbuts.uiButtonState==1 && otherbuts.uiButtonGroup==uiButtonGroup)
                    otherbuts.uiButtonState=0;   //if down then make up                                
             }
          uiButtonState=1;  //make this button the down button now!                         
    }

drawpress=false;
hasfocus=false;

uiFlashButton=false;
var evNum;
evNum=uiEventNum;
if uiEventObject != noone
// if object_exists(uiEventObject) then
  with (uiEventObject) 
   {if evNum>=0 event_user(evNum);}
   
soundindex=1; //click
event_user(10); //process sound event;      

