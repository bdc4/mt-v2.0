if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

event_inherited();


//if rubberbanding exit; 

if mouse_move exit;
   else {mouse_pressedy=mouse_y;
         mouse_pressedx=mouse_x;
         mouse_move=true;        
         first_press=true; 
         mouse_origy=mouse_y; //to determine if it is a click or move.
         mouse_click=false;
         flicked=0;
         mouse_time = get_timer();
        }
        
       

