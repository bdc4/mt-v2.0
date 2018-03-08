/// @description hide keyboard

//we need to re-enabled disabled controls;
isHiding=true; //flag closing flag


if guiSlide>1 
  {
    with (ui_defaults)
      { uiMoveX=x;
        uiMoveY=y+other.guiSlide;
        uiAniMove=true;
      }    
    guiSlide=0;  
  }

//check to see if we are overlapping any other componets, if so then disable the mouse handle
     var l,t;
      l=ds_list_create();
      while 1{
        t = collision_rectangle(0,boardy,uiGUIWidth,boardy+boardh, ui_defaults, false, true);
        if t{ ds_list_add(l,t);
              instance_deactivate_object(t);
              t.uiMouseHandle=true;             //re-enable mouse handler;
            }
        else break;
             }
           
      for(t=0;t<ds_list_size(l);t+=1)
        { instance_activate_object(ds_list_find_value(l,t)); }
      ds_list_destroy(l);
      
uiMoveY=uiGUIHeight+10;
uiAniMove=true;
uiFadeOut=true;   

     

