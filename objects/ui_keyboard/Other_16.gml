/// @description process eventobject when enter pressed
var evNum;
evNum=uiEventNum;
if uiEventObject != noone
  with (uiEventObject) 
   {if evNum>=0 event_user(evNum);}

