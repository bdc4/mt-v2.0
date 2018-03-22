ctb_update();

#region Textbox Easing
if (ab_easing[? "time"] < ab_easing[? "duration"]) {
	alertboxArea[1] = ease_out_back(ab_easing[? "time"],ab_easing[? "start"],ab_easing[? "dest"]-ab_easing[? "start"],ab_easing[? "duration"]);
	ab_easing[? "time"]++;
}
#endregion

x = alertboxArea[0];
y = alertboxArea[1];

/*
if (fadeOut and y > room_height) {
	instance_destroy();	
}
*/


