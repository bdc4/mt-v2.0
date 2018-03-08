var ydiff,xdiff,tdiff,curlen;

SwipedLeft=false;
SwipedRight=false;
SwipedUp=false;
SwipedDown=false;

ydiff=mouse_y - mouse_origy;
xdiff=mouse_x - mouse_origx;

//need time to be quick for a swipe
tdiff=(get_timer()-mouse_time)/1000;
if tdiff>400 exit;  //too slow as a swipe....

curlen=uiSwipeLength * room_width;


if (abs (ydiff) < curlen ) &&
   (abs (xdiff) < curlen )
 {  //not a swipe, just a press....ignore...
         exit;
 }

//only deal with the bigger swipe length (in case its an angle swipe) 
if abs(xdiff)>abs(ydiff)
   {
      if mouse_x>mouse_origx SwipedRight=true;
             else SwipedLeft=true;
   }  else
   {  if mouse_y>mouse_origy SwipedDown=true;
         else SwipedUp=true;
   }      
   
if SwipedRight || SwipedLeft || SwipedUp || SwipedDown
   {
    var evNum;
    evNum=uiEventNum;
    if uiEventObject != noone then
     if object_exists(uiEventObject) then
       with (uiEventObject) 
        {if evNum>=0 event_user(evNum); }   
   }
  



 
 
 
 
 
 
 

