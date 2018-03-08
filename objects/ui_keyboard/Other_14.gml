/// @description show keyboard event
if uiVisible exit;


var fx,fy,fs,fl,fh,fc,ft,curx,cury,curchar;

if uiFocusID.ystart>boardy
 {
  //  guiSlide=(boardy-(uiFocusID.ystart))+uiFocusID.sprite_height+(50*yfc);   
    guiSlide=((uiFocusID.ystart)-boardy)+uiFocusID.sprite_height+(50*yfc);   
    with (ui_defaults)
     {
        uiMoveY=ystart-other.guiSlide;
        uiMoveX=x;
        uiAniMove=true;   
     }
 }    


//check to see if we are overlapping any other componets, if so then disable the mouse handle
     var l,t;
      l=ds_list_create();
      while 1{
        t = collision_rectangle(0,boardy+guiSlide,uiGUIWidth,boardy+guiSlide+boardh, ui_defaults, false, true);
        if t{ ds_list_add(l,t);
              instance_deactivate_object(t);
              t.uiMouseHandle=false;             //re-enable mouse handler;
            }
        else break;
             }
           
      for(t=0;t<ds_list_size(l);t+=1)
        { instance_activate_object(ds_list_find_value(l,t)); }
      ds_list_destroy(l);
      
uiVisible=true;
uiMoveY=boardy;
uiAniMove=true;
uiFadeIn=true;
isHiding=false;
if curState != 1 {curState=0;  //leave caplocks but not alt
                  cap_lock=false;  
                  shift_key.drawpress=false;
                  
                  }
event_user(3); //refresh keys




      



