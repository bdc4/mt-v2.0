with (ui_defaults) {uiMouseHandle=true}; 


var i_d = ds_map_find_value(async_load, "id");


 if i_d == uitextboxmsg
    {
    if ds_map_find_value(async_load, "status")
       {
          {
          if uiGetNumber==false
            { testvalue = ds_map_find_value(async_load, "result");
              if testvalue != "" uiTextValue=testvalue;
            } else
            {
              testvalue = ds_map_find_value(async_load, "value");
              uiTextValue = string(testvalue);          
            }   
          modified = true;
          if object_exists(uiEventObject) then      //we call the statechanged event on controller if set
             with (uiEventObject) {event_user(0);}
          }
       }
    }
uitextboxmsg= -1;    

