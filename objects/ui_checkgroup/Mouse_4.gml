if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;



event_inherited();



var evNum;

itemindex = ((mouse_y-y) div lineheight);
if itemindex>array_length_1d(items)-1 then itemindex=array_length_1d(items)-1;

if uiMultiSelect then //if allow multiselect....
   {
   if itemschecked[itemindex] itemschecked[itemindex]=false; 
      else itemschecked[itemindex]=true;
   }

    
//process event...
    evNum=uiEventNum; 
    if uiEventObject != noone  
     if object_exists(uiEventObject) then
          with (uiEventObject) {if evNum>=0 event_user(evNum);}

soundindex=1; //click
event_user(10); //process sound event;                      
     

