/// @description set ease defaults
switch (EaseKind)
   {
      case 0:  //default movement
                EaseType=25;                 //type of ease based on JQuery Easing Plugin
                EaseCurTime=0;                // current time  don't need to set
                EaseStart=0;                 // beginning value
                EaseEnd=1  ;                 // ending value
                EaseDur=30;                  // steps
                EaseCurValue=1;              // CurValueofEase
                inEase=false;                  // internal flag
                break;
      case 1:   //default Zoom
                EaseType=25;                 //type of ease based on JQuery Easing Plugin
                EaseCurTime=0;                // current time  don't need to set
                EaseStart=0;                 // beginning value
                EaseEnd=1  ;                 // ending value
                EaseDur=30;                  // steps
                EaseCurValue=1;              // CurValueofEase
                inEase=false;                  // internal flag
                break;
      case 2:   //default Wobble
                EaseType=1;                 //type of ease based on JQuery Easing Plugin
                EaseCurTime=0;                // current time  don't need to set
                EaseStart=0;                 // beginning value
                EaseEnd=1  ;                 // ending value
                EaseDur=10;                  // steps
                EaseCurValue=1;              // CurValueofEase
                inEase=false;                  // internal flag
                break;  
   
   }

