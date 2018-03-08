/// @description sound controls....

// This determines if we need to do simple sound click on click,  or we process the more advanced
//  sound by calling the uiClickSound custom function with soundindex as the argument0;

//sound index
//  1 : on left pressed      //this is only one that doesn't support callback
//  2 : on Move Start;       //only callback future
//  3 : on Move End;         //only callback future
//  4 : scrolling            //only callback future

if uiClickSound==-1 { exit; } //not set;

if uiCallBackSound==false
    {
      if soundindex==1 {audio_play_sound(uiClickSound,1,false);}              
    }
else
    {
      if script_exists(uiClickSound) script_execute(uiClickSound,soundindex);
    }      



