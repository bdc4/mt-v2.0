if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

event_inherited();

with (ui_defaults) {uiMouseHandle=false};  //disable all mouse controls on other events

if uiEventObject== noone //no event object so we do standard get_string_async
{
   if uiGetNumber==false {uitextboxmsg=get_string_async(uiTextLabel,"" + string_replace_all(uiTextValue,"#","\\#"));}
   else {uitextboxmsg=get_integer_async(uiTextLabel,uiTextValue);}
} else //has event object
  {
    var evNum;
    evNum=uiEventNum;
    if uiEventObject != noone
     if object_exists(uiEventObject) then
       with (uiEventObject) 
        {if evNum>=0 event_user(evNum); }  

  }


