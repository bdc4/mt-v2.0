/// @description Process event from lookuplist object

var evNum;

if other.itemindex>=0
   {
     uiTextValue=other.items[other.itemindex];
     itemindex=other.itemindex;
     modified=true;
     
     //process event...
    evNum=uiEventNum;   
    if uiEventObject != noone then
     if object_exists(uiEventObject) then
          with (uiEventObject) {if evNum>=0 event_user(evNum);}
    
    alarm[0]=room_speed div 5;  //detroy lookup
    soundindex=1; //click
    event_user(10); //process sound event;  
   }  

