/// @description mouse lifted or moved off control

var evNum;
var flicktime;

mouse_move=false;
mouse_movex=false;
first_press=false;
//if startline==0 drawy=0;
rubberbanding=false;

//see if it is a click
if (abs (mouse_y - mouse_origy) < 15) // && mouse_y >= y)  //a click not a move
    {mouse_click=true;
    itemindex = ((mouse_origy-y-drawy) div lineheight)-1;
    if uiDrawHeader==false itemindex +=1;  //if draw header then add one to itemselected.
    if itemindex>array_length_1d(items)-1 then itemindex=array_length_1d(items)-1;
    if itemindex<0 itemindex=0;
    //process event...
    evNum=uiEventNum;   
    if uiEventObject != noone
     if object_exists(uiEventObject) then
          with (uiEventObject) {if evNum>=0 event_user(evNum);}
          
    if uiComboID >= 0      
       if instance_exists(uiComboID) then                        //for combo drop down list...
         with (uiComboID) {if evNum>=0 event_user(evNum);}
          
    soundindex=1; //click
    event_user(10); //process sound event;   
   
    }  
else //see if it was a quick swipe...flicked!                              
   { 
   if noscroll exit;  //disregard if no scrolling
   flicktime= (get_timer()-mouse_time)/1000;
//   if flicktime < 160 then flicked=400-flicktime;
   if flicktime < 160 then flicked=abs( (50-flicktime) + (3 * abs(mouse_y - mouse_origy)));
   if (mouse_y - mouse_origy)<0 flicked=flicked* -1;   
   }  

