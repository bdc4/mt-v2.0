ctb_update();

if y > yy and (mouse_y > yy-20 or keyboard_check_pressed(CTB_SkipKey)) {
	x_gui_maximize_textbox();
}
#region Textbox Easing
if (tb_easing[? "time"] < tb_easing[? "duration"]) {
	textboxArea[1] = ease_out_back(tb_easing[? "time"],tb_easing[? "start"],tb_easing[? "dest"]-tb_easing[? "start"],tb_easing[? "duration"]);
	tb_easing[? "time"]++;
}
#endregion

x = textboxArea[0];
y = textboxArea[1];

visible = y < yy;


