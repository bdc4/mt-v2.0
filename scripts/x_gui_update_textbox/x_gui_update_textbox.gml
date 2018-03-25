var msg = argument[0];

//if instance_exists(obj_textbox) {
//	instance_destroy(obj_textbox);
//}

msg = string_replace_all(msg, ".", ".[pause:30]");
msg = string_replace_all(msg, "?", "?[pause:30]");
msg = string_replace_all(msg, "!", "![pause:30]");
msg = string_replace_all(msg, ";", ";[pause:30]");
msg = string_replace_all(msg, ",", ",[pause:30]");

tb = obj_textbox;//instance_create_layer(0,room_height,GUI.GUI_MID,obj_textbox);
var fadeVal = tb.fadeOut;
tb.msg = msg;	
	
with tb {
	if argument_count > 1 {
		if (argument[1] == true) event_perform(ev_create,0);
	}
	ctb_add_text(msg);
	
	if fadeVal {
		tb_easing[? "start"] = textboxArea[3]-1;
		tb_easing[? "dest"] = yy*13/16;
		tb_easing[? "duration"] = 30;
		tb_easing[? "time"] = 0;
	}
}