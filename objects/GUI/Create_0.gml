/// @description Insert description here
// Init Main Camera

//Helpful vars
view_camera[0] = camera_create_view(0, 0, room_width, room_height);
xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

//Init drawing areas & easing vars
#region Textbox Area
textboxArea = [0,yy*13/16,xx,yy];
tb_easing = ds_map_create();
tb_easing[? "start"] = textboxArea[3]-1;
tb_easing[? "dest"] = yy*13/16;
tb_easing[? "duration"] = 30;
tb_easing[? "time"] = 0;
#endregion

#region Left Bar Area
leftboxArea = [-60,32,120,yy*13/16-32];
lb_easing = ds_map_create();
lb_easing[? "start"] = -120;
lb_easing[? "dest"] = -90;
lb_easing[? "duration"] = 30;
lb_easing[? "time"] = 0;
#endregion

#region Right Bar Area
rightboxArea = [xx+60,32,xx-120,yy*13/16-32];
rb_easing = ds_map_create();
rb_easing[? "start"] = xx+120;
rb_easing[? "dest"] = xx-40;
rb_easing[? "duration"] = 30;
rb_easing[? "time"] = 0;
#endregion


//Init GUI Layers

//Background
BG_BACK = layer_create(175);
BG_MID = layer_create(150);
BG_FRONT = layer_create(125);

//Foreground
FG_BACK = layer_create(100);
FG_MID = layer_create(75);
FG_FRONT = layer_create(50);

//HUD
HUD_BACK = layer_create(25);
HUD_MID = layer_create(0);
HUD_FRONT = layer_create(-25);

//GUI
GUI_BACK = layer_create(-50);
GUI_MID = layer_create(-75);
GUI_FRONT = layer_create(-100);

//Main
instance_create_layer(0,0,GUI_MID,obj_leftMenu);
instance_create_layer(0,0,GUI_MID,obj_rightMenu);
x_gui_update_textbox("This is a test of the textbox area!");