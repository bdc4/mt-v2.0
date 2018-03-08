if not isFocused then exit;
if uiPopupOnly exit;   //only accept input from popup


var curtab;
if (keyboard_key=vk_tab)
    {

                         if keyboard_check_direct(vk_shift) then curtab=uiTabOrder-1;
                                                            else curtab=uiTabOrder+1;
                         if (curtab>0) && (keyboard_lasttab=false)  //tab order is default 0;                                   
                         with (ui_defaults)
                           {
                           if uiTabOrder=curtab event_user(0);  //select focused..  //event_perform(ev_mouse,ev_left_press);                           
                           keyboard_lasttab=true;
                           }
     repeat_last=repeat_delay;   
    } 

