/// @description Insert description here
// You can write your code in this editor
if (!menuOpen and point_in_rectangle(mouse_x,mouse_y, x, y, x+sprite_width, y+sprite_height))
	menuOpen = true;

if point_in_rectangle(mouse_x,mouse_y, x+8, y+8, x+32, y+32)
	menuOpen = false;
	
if menuOpen {
	
	lb_easing[? "start"] = leftboxArea[0];
	lb_easing[? "dest"] = 0;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;
	
}

if !menuOpen {
	
	lb_easing[? "start"] = leftboxArea[0];
	lb_easing[? "dest"] = -90;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;	
	
}
