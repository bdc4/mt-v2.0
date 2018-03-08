if inForm==false exit;
if canfocus==false exit;

//if we click anywhere on room that isn't a ui_component then we refresh all active objects when inForm==true;

var inst;

inst=instance_position(mouse_x, mouse_y, ui_defaults);
if inst=noone {
    with (ui_defaults) do 
                 {
                  isFocused=false;
                  uiFocusID=noone; //will set the focus object.
                  uiRefresh=true;   //will refersh all ui (close comboboxes for example)...
                 } 
              }

