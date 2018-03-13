/// @description Insert description here
// You can write your code in this editor
menuOpen = !menuOpen;

with (GUI) {
	if other.menuOpen {
		lb_easing[? "start"] = GUI.leftboxArea[0];
		lb_easing[? "dest"] = 0;
		lb_easing[? "duration"] = 30;
		lb_easing[? "time"] = 0;
	} else {
		lb_easing[? "start"] = GUI.leftboxArea[0];
		lb_easing[? "dest"] = -90;
		lb_easing[? "duration"] = 30;
		lb_easing[? "time"] = 0;	
	}
}