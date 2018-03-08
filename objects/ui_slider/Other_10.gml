/// @description  on mouse movement

var getper;

if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

if (mouse_move)
  {

   if uiValue != last_per
                     {last_per=uiValue; //click on change
                      soundindex=1; //click
                      event_user(10); //process sound event;   
                     }        

  
    if (mouse_x-x)>0 
      {
        getper = (mouse_x-(x+uiSelectSize)) / (sprite_width - (uiSelectSize * 2));
        uiValue= ((uiMax-uiMin) * getper) + uiMin;   
        if uiValue>uiMax uiValue=uiMax;
        if uiValue<uiMin uiValue=uiMin;

        var evNum;
        evNum=uiEventNum;
        if uiEventObject != noone then
         if object_exists(uiEventObject) then
            with (uiEventObject) 
               {if evNum>=0 event_user(evNum); }
                       
               
      }            
  }

  


