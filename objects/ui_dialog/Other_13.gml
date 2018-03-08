/// @description will disable all mouse controls beneath panel;
var maxdepth;
maxdepth=0;
with ui_defaults 
  {
      if (uiAnchor != other.id) {uiMouseHandle=false;  
                                 if depth<maxdepth maxdepth=depth;}
  }

depth=maxdepth-1; 
uiMouseHandle=true; //reset ourselves.  

