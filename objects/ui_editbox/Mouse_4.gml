if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

event_inherited();

if cursor_pos=-1 cursor_pos=string_length(uiTextValue);  //set initial curpos pos 
if set_mouse_pos=-1 set_mouse_pos=mouse_x-x;
keyboard_lasttab=false;  
keyboard_string=""; //reset keyboard buffer...    
                                               //this will set the mousepos x for the draw event to update the cursor.
                                               

if uiEventObject== noone //no event object so we do standard get_string_async
{
  if uiInLineEditing==false
    {
      with (ui_defaults) {uiMouseHandle=false};  //disable all mouse controls on other events        
      if uiGetNumber==false {uitextboxmsg=get_string_async(uiTextLabel,uiTextValue);}
      else {uitextboxmsg=get_integer_async(uiTextLabel,uiTextValue);}       
    }  
} else //has event object
  {
    var evNum;
    evNum=uiEventNum;
    if uiEventObject != noone
     if object_exists(uiEventObject) then
       with (uiEventObject) 
        {if evNum>=0 event_user(evNum); }  

  }
 
//need to set all other components to be inForm aware..overwrite, keypress...etc
with (ui_defaults) {inForm=true;}


