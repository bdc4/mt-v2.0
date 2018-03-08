/// @description create ease object for animation

var tmp;


tmp=instance_create(-1,-1,ui_ani_control);

tmp.EaseKind=EaseKind;  //set type of ease  (0=movement, 1=zoom, 2=pulse,3=wobble...etc)

with (tmp) {event_user(2);}      //set defaults; for that ease

tmp.EaseControl=self.id;  //set link to this control


tmp.EaseType=uiEaseType;
tmp.EaseCurTime=uiEaseCurTime;                // current time  don't need to set
tmp.EaseStart=uiEaseStart;                 // beginning value
tmp.EaseEnd=uiEaseEnd  ;                 // ending value
tmp.EaseDur=uiEaseDur;                  // steps
tmp.EaseCurValue=uiEaseCurValue;              // CurValueofEase
tmp.depth=depth-1;  //put in front for some ani's
tmp.StartEase=true;  


