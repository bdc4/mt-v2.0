var msg = argument0;

if instance_exists(obj_textbox) {
	if obj_textbox.msg != msg 
		instance_destroy(obj_textbox)
}

tb = instance_create_layer(GUI.textboxArea[0],GUI.textboxArea[1],GUI.GUI_MID,obj_textbox);
tb.msg = msg;	
	
with obj_textbox {
	ctb_add_text(msg);
}