/// @description Insert description here
// You can write your code in this editor
x = leftboxArea[0];
y = leftboxArea[1];

#region Leftbox Easing
if (lb_easing[? "time"] < lb_easing[? "duration"]) {
	leftboxArea[0] = ease_out_back(lb_easing[? "time"],lb_easing[? "start"],lb_easing[? "dest"]-lb_easing[? "start"],lb_easing[? "duration"]);
	lb_easing[? "time"]++;
}
#endregion

#region Update Child Button Locations

var z = ds_map_find_first(lm_button);
while (ds_map_find_next(lm_button, z) != undefined) {
	with (z) {
		x = other.x+8;
	}
	z = ds_map_find_next(lm_button, z);
}

#endregion

#region Show/Hide Menu

if menuLock or (!menuOpen and point_in_rectangle(mouse_x,mouse_y, x-32, y, x+sprite_width, y+sprite_height)) {
	
	menuOpen = true;
	lb_easing[? "start"] = leftboxArea[0];
	lb_easing[? "dest"] = 0;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;
	
}

if !menuLock and menuOpen and !point_in_rectangle(mouse_x,mouse_y, x-32, y, x+sprite_width, y+sprite_height) {
	
	menuOpen = false;
	lb_easing[? "start"] = leftboxArea[0];
	lb_easing[? "dest"] = -100;
	lb_easing[? "duration"] = 30;
	lb_easing[? "time"] = 0;	
	
}

#endregion

