if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;


event_inherited();



if (uiToggleOn) uiToggleOn=false; 
  else uiToggleOn=true;

if uiEventObject != noone
 if object_exists(uiEventObject) then      //we call the statechanged event on controller if set
   with (uiEventObject) {event_user(0);}

soundindex=1; //click
event_user(10); //process sound event;

