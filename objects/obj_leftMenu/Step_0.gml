/// @description Insert description here
// You can write your code in this editor
event_inherited();

#region Leftbox Easing
if (lb_easing[? "time"] < lb_easing[? "duration"]) {
	x = ease_out_back(lb_easing[? "time"],lb_easing[? "start"],lb_easing[? "dest"]-lb_easing[? "start"],lb_easing[? "duration"]);
	lb_easing[? "time"]++;
}
#endregion

#region Show/Hide Menu

if !menuOpen and (menuLock or point_in_rectangle(mouse_x,mouse_y, 0, room_height*1/4, 64, room_height*3/4) and mouse_check_button_pressed(mb_left)) {
	
	menuOpen = true;
	lb_easing[? "start"] = -140;
	lb_easing[? "dest"] = 0;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;
	
}

else if menuOpen and !menuLock and point_in_rectangle(mouse_x,mouse_y, x+room_width*1/12,room_height*1/4+room_height*1/8, x+room_width*1/12+40, room_height*5/8) and mouse_check_button_pressed(mb_left) {
	
	menuOpen = false;
	lb_easing[? "start"] = 0;
	lb_easing[? "dest"] = -140;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;	
	
}

#endregion

