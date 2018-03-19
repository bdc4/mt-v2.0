/// @description Insert description here
// You can write your code in this editor
event_inherited();

#region Easing
if (easing[? "time"] < easing[? "duration"]) {
	y = ease_out_back(easing[? "time"],easing[? "start"],easing[? "dest"]-easing[? "start"],easing[? "duration"]);
	easing[? "time"]++;
}
#endregion

var eveTrigger = showMenu ? event_user(3) : event_user(4);