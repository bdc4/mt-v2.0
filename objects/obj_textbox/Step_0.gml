ctb_update();

#region Textbox Easing
if (tb_easing[? "time"] < tb_easing[? "duration"]) {
	textboxArea[1] = ease_out_back(tb_easing[? "time"],tb_easing[? "start"],tb_easing[? "dest"]-tb_easing[? "start"],tb_easing[? "duration"]);
	tb_easing[? "time"]++;
}
#endregion

x = textboxArea[0];
y = textboxArea[1];

/*
if (fadeOut and y > room_height) {
	instance_destroy();	
}
*/


