/// @description Set Focus
//called when using tab/shift-tab
//will set itself as focused and remove all others.


var curID;
curID=self.id;
with (ui_defaults)
{
uiFocusID=curID;                      //will set the focus object.
isFocused=false;
uiRefresh=true;   //will refersh all ui (close comboboxes for example)...
}

isFocused=true;
cursor_pos=string_length(uiTextValue);
keyboard_string=""; //reset keyboard buffer...



