/// @description Insert description here
// You can write your code in this editor
event_inherited();

#region Easing

if (easing[? "time"] < easing[? "duration"]) {
	y = ease_out_back(easing[? "time"],easing[? "start"],easing[? "dest"]-easing[? "start"],easing[? "duration"]);
	easing[? "time"]++;
}

#endregion

op_button[? "Music"].uiMouseHandle = !op_button[? "Mute All"].muteAll;
op_button[? "SFX"].uiMouseHandle = !op_button[? "Mute All"].muteAll;