/// @description from keyboard

if keyboard_press="" exit;

var curtab;

if keyboard_press="back"
          { uiTextValue = string_delete(uiTextValue,cursor_pos,1); 
            if cursor_pos>0 cursor_pos -=1;
            if start_pos>0 start_pos-=1;
            keyboard_press="";
          }

if keyboard_press="enter"  //next or enter
           {          
              curtab=uiTabOrder+1;
              if (curtab>0)
                 with (ui_defaults)
                   {
                   if uiTabOrder=curtab event_user(0);  //select focused..  //event_perform(ev_mouse,ev_left_press);                           
                   }          
            keyboard_press="";       
           }                
    
if keyboard_press != ""            
        {
         keyboard_press=string_replace_all(keyboard_press,"#","\\#")        
         uiTextValue= string_insert(keyboard_press,uiTextValue,cursor_pos+1);  //bug can't reset keyboard_lastchar so I use string...weird
         cursor_pos +=string_length(keyboard_press);
         keyboard_press="";
        }

if string_length(uiTextValue)>uiTextLimit uiTextValue=string_copy(uiTextValue,1,uiTextLimit);

//little safety;
if cursor_pos>string_length(uiTextValue) cursor_pos=string_length(uiTextValue);
if cursor_pos<0 cursor_pos=0;

if cursor_pos<start_pos then {start_pos=cursor_pos;}
    
  
if start_pos<0 start_pos=0;






