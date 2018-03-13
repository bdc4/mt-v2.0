/// @description Insert description here
// You can write your code in this editor
menuOpen = !menuOpen;

with (GUI) {
	if other.menuOpen {
		rb_easing[? "start"] = GUI.rightboxArea[0];
		rb_easing[? "dest"] = xx-other.sprite_width;
		rb_easing[? "duration"] = 30;
		rb_easing[? "time"] = 0;
	} else {
		rb_easing[? "start"] = GUI.rightboxArea[0];
		rb_easing[? "dest"] = xx-40;
		rb_easing[? "duration"] = 30;
		rb_easing[? "time"] = 0;	
	}
}