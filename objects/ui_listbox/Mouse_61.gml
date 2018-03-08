if noscroll then exit;
if position_meeting(mouse_x,mouse_y,self)
{
drawy=drawy - (sprite_height div 10);
if drawy< (bottomline-(sprite_height div 3)) event_user(0);
}


