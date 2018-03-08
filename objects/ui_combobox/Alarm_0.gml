/// @description destory lookuplist object

if lookupid != noone
    { 
    //enable mouse events if we were overlapping
      var l,t;
      l=ds_list_create();
      while 1{
        t = collision_rectangle(cx1,cy1,cx2,cy2, ui_defaults, false, false);
        if t{ ds_list_add(l,t);
              instance_deactivate_object(t);
              t.uiMouseHandle=true;             //re-enable mouse handler;
            }
        else break;
             }
           
      for(t=0;t<ds_list_size(l);t+=1)
        { instance_activate_object(ds_list_find_value(l,t)); }
      ds_list_destroy(l);

    
      with (lookupid) instance_destroy();
      lookupid= noone;
      
      
      
      
      
    }  

