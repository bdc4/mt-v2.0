if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

if (mouse_move && noscroll==false)
                  { drawy= drawy + (mouse_x - mouse_pressedx);
                    mouse_pressedy = mouse_y;
                    mouse_pressedx = mouse_x;
                  }      


