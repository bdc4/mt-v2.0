if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

if mouse_move then exit;  //already moving...


//did user select the selector?

mouse_move=false;

if (abs(mouse_x-select_xpos)<uiSelectSize ) //&&
 //  (abs(mouse_y-select_ypos)<uiSelectSize ) 
   {
     mouse_move=true;
     mouse_origx = mouse_x;
     mouse_origy = mouse_y;
   }  








  

