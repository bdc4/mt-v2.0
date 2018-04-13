/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

#region Easing

if (easing[? "time"] < easing[? "duration"]) {
	x = ease_out_back(easing[? "time"],easing[? "start"],easing[? "dest"]-easing[? "start"],easing[? "duration"]);
	easing[? "time"]++;
}

#endregion

var inMotion = easing[? "duration"] != easing[? "time"];

for (var i = 0; i < array_length_1d(btnList); i++) {
	with btnList[i] uiMouseHandle = !inMotion;	
}

if !inMotion and x > room_width {
	with ui_defaults {
		if (uiAnchor == other)
			instance_destroy();	
	}
	instance_destroy();
}