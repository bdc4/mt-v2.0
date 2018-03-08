if not isFocused exit;  //we have focus?
if uiPopupOnly exit;   //only accept input from popup

if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

var curtab;
repeat_last -=1;


if repeat_last<=0
{
 switch (keyboard_key)
    {
    case vk_backspace  : uiTextValue = string_delete(uiTextValue,cursor_pos,1); 
                         if cursor_pos>0 cursor_pos -=1;
                         if start_pos>0 start_pos-=1;
                         break;

    case vk_delete     : uiTextValue = string_delete(uiTextValue,cursor_pos+1,1); 
                         //cursor_pos -=1;
                         break;
                         
    case vk_left       : if cursor_pos>0 {cursor_pos -=1;} 
                         break;
                             
    case vk_right      : if cursor_pos<string_length(uiTextValue) cursor_pos +=1;
                         break;
                         
    case vk_home       : cursor_pos=0;start_pos=0;
                         break;

    case vk_end        : cursor_pos=string_length(uiTextValue);
                         break;                                   
                         
    } //switch    
 repeat_last=repeat_delay;   
}    


            
if keyboard_string != "" 
        {
         //keyboard_string=string_replace_all(keyboard_string,"#","\#");        
         uiTextValue= string_insert(keyboard_string,uiTextValue,cursor_pos+1);  //bug can't reset keyboard_lastchar so I use string...weird
         cursor_pos +=string_length(keyboard_string);
         keyboard_string="";
        }


if string_length(uiTextValue)>uiTextLimit uiTextValue=string_copy(uiTextValue,1,uiTextLimit);

//little safety;
if cursor_pos>string_length(uiTextValue) cursor_pos=string_length(uiTextValue);
if cursor_pos<0 cursor_pos=0;

if cursor_pos<start_pos then {start_pos=cursor_pos;}
    
  
if start_pos<0 start_pos=0;





