if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

//handle clickonchar feature,  emulate mouse press/release if character is pressed

if string_lower(keyboard_lastchar)==string_lower(uiClickOnChar)  //if keypressed the same as click, then simulate press
    {
    keyboard_lastchar= "";
    event_perform(ev_mouse, ev_left_press);
    event_perform(ev_mouse, ev_left_release);
    }

