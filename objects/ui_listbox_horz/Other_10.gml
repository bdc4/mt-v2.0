/// @description mouse lifted or moved off control

var evNum,numitems,snapx;
var flicktime;

mouse_move=false;
mouse_movex=false;
first_press=false;
//if startline==0 drawy=0;
rubberbanding=false;
numitems=array_length_1d(items);

//see if it is a click
if (abs (mouse_x - mouse_origx) < 15) // && mouse_y >= y)  //a click not a move
    {mouse_click=true;
    for (fx=0;fx<numitems;fx+=1)
      if itemspos[fx]>((mouse_origx-x-drawy)-uiLeftMargin) 
         { itemindex=fx;
           break;
         }  
    if itemindex>numitems-1 then itemindex=numitems-1;
    if itemindex<0 itemindex=0;
    //process event...
    
    alarm[0]=uiDelayEvent;
    
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
   if flicktime < 160 then flicked=abs( (50-flicktime) + (2 * abs(mouse_x - mouse_origx)));
   if (mouse_x - mouse_origx)<0 flicked=flicked* -1;  

   if uiSnapLeft   
      {snapx = ((drawy + flicked) div (uiItemWidth)) * (uiItemWidth); 
       if abs((drawy + flicked) mod (uiItemWidth)) > (uiItemWidth div 2) snapx = snapx - uiItemWidth;
       flicked=snapx-drawy;
      }  
   // if uiSnapCenter  
   //   {snapx = ((drawy + flicked) div (uiItemWidth)) * (uiItemWidth); 
   //    if abs((drawy + flicked) mod (uiItemWidth)) > (uiItemWidth div 2) snapx = snapx - uiItemWidth;
   //    flicked=snapx-drawy;
   //   }  
      
      
   }  

