if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

if (uiEnforceFocus) &&  (hasfocus==false) {drawpress=false; exit;}
if uiButtonLocked exit;
if uiPressFlash {
                  uiFlashButton=true;
                  alarm[0]=room_speed div 3;                 
                } else alarm[0]=1;   //call alarm to call object event.
              

