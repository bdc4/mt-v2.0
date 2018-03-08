/// @description Insert description here
// Init Main Camera
view_camera[0] = camera_create_view(0, 0, room_width, room_height);
xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

//Init drawing areas

//[x1,y1,x2,y2]
textboxArea = [0,yy*13/16,xx,yy];

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