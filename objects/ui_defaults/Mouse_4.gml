if inForm==false exit;
if canfocus==false exit;

if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;


var curID;


curID=self.id;

with (ui_defaults)
  {
    uiFocusID=curID;                      //will set the focus object.
    isFocused=false;
    uiRefresh=true;   //will refersh all ui (close comboboxes for example)...
  }

isFocused=true;


