EaseKind=-1;                    //0=movement,1=zooming,2=wobble,3=fading

//defaults for easing

//ease for movement
EaseControl=noone;
EaseType=25;                 //type of ease based on JQuery Easing Plugin
EaseCurTime=0;                // current time  don't need to set
EaseStart=0;                 // beginning value
EaseEnd=1  ;                 // ending value
EaseDur=30;                  // steps
EaseCurValue=1;              // CurValueofEase
inEase=false;                  // internal flag
EaseDone=false;
EasePause=false;               //sometimes we need to hold animation not free


StartEase=false;

KillEase=true;      //we kill the ease on finish else repeat....
initvars=true;       //sets up initial state

altdir=1;  //used constant animation direction
CurFading=1;

