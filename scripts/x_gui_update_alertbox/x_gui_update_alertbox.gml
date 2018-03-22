var msg = argument0;

//if instance_exists(obj_textbox) {
//	instance_destroy(obj_textbox);
//}

ab = obj_alertbox;//instance_create_layer(0,room_height,GUI.GUI_MID,obj_textbox);
var fadeVal = ab.fadeOut;
ab.msg = msg;	
	
with ab {
	event_perform(ev_create, 0);
	audio_play_sound(snd_alert,1000,false);
	ctb_add_text(msg);
	
	if fadeVal {
		x_gui_maximize_alertbox();
	}
}