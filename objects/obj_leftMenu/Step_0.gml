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

var z = ds_map_find_first(lm_button);
while (ds_map_find_next(lm_button, z) != undefined) {
	with (z) {
		x = other.x+8;
	}
	z = ds_map_find_next(lm_button, z);
}