var tw;

tw=string_length(CurDispText);

     
if (CurStartIndex<=tw)
    { //path_position=0.005;
      path_position=0.005;
      if uiPathSpeed<0 CurStartIndex +=1;  //start on next character (disappearing text to left).
    } else {path_position=0;
            CurInMotion=false; 
            path_end();}
  

