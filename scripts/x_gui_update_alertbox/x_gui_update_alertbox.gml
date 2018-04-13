var msg = argument0;

//if instance_exists(GUI_textbox) {
//	instance_destroy(GUI_textbox);
//}

ab = GUI_alertbox;//instance_create_layer(0,room_height,GUI.GUI_MID,GUI_textbox);
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