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

if !menuOpen and (menuLock or point_in_rectangle(mouse_x,mouse_y, 0, room_height*1/4, 64, room_height*3/4)) {
	
	menuOpen = true;
	lb_easing[? "start"] = -140;
	lb_easing[? "dest"] = 0;
	lb_easing[? "duration"] = 60;
	lb_easing[? "time"] = 0;
	
}

if menuOpen and !menuLock and !point_in_rectangle(mouse_x,mouse_y,  0, 0, room_width*1/8, room_height) {
	
	menuOpen = false;
	lb_easing[? "start"] = 0;
	lb_easing[? "dest"] = -140;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;	
	
}

#endregion

