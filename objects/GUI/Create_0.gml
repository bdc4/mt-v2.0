/// @description Insert description here
// Init Main Camera

ini_open("config.ini");
MUSIC_VOL = ini_read_real("Options", "MUSIC_VOL", 100);
SFX_VOL = ini_read_real("Options", "SFX_VOL", 100);
MUTE_ALL =  ini_read_real("Options", "MUTE_ALL", false);
ini_close();

show_debug_message("Vals (MUSIC, SFX, MUTE): "+string(MUSIC_VOL)+" "+string(SFX_VOL)+" "+string(MUTE_ALL))

//Helpful vars
view_camera[0] = camera_create_view(0, 0, room_width, room_height);
xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

//Init drawing areas & easing vars

//Disabled
#region Right Bar Area
/*
rightboxArea = [xx,32,xx-480,yy*13/16-32];
rb_easing = ds_map_create();
rb_easing[? "start"] = xx+120;
rb_easing[? "dest"] = xx-40;
rb_easing[? "duration"] = 60;
rb_easing[? "time"] = 0;
*/
#endregion

fonts = [f_normal,f_large];
tbFont = f_normal; //TODO import from previous session

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
instance_create_layer(0,room_height*1/4,GUI_MID,obj_leftMenu);
instance_create_layer(room_width*1/4,-room_height*2/4,GUI.GUI_MID,obj_optionsMenu);
instance_create_layer(0,0,GUI_MID,obj_textbox);
instance_create_layer(0,0,GUI_FRONT,obj_alertbox);
instance_create_layer(0,0,GUI_FRONT,obj_eventController);

if !file_exists("config.ini") {
	x_gui_update_textbox("Welcome to the GUI test engine! Press SPACE to continue.");
	x_gui_update_textbox("You can also click on this textbox instead of pressing SPACE!");
	x_gui_update_textbox("Clicking or pressing SPACE during long texts will fast-forward. Try it out on the next message!");
	x_gui_update_textbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quam ex, ullamcorper ut dictum in, egestas sed augue. In fermentum, lacus id feugiat sagittis, risus felis scelerisque sapien, quis vestibulum lectus tellus in arcu. Sed dolor enim, rutrum in eros a, congue tincidunt metus. Pellentesque est augue, fermentum at tortor non, finibus vestibulum justo. Sed et ligula eget sem commodo ornare. Etiam sodales, velit nec varius molestie, mi eros posuere odio, a bibendum elit neque id tortor. Donec faucibus justo est. Etiam non iaculis neque, at vulputate eros. Vivamus ac nibh velit. Sed at eros at metus lacinia placerat ut a massa. Duis placerat malesuada erat eget pretium. Nam turpis tortor, eleifend vel libero nec, imperdiet hendrerit nunc. Fusce dictum purus non porta gravida. Nullam id augue lacinia, mollis eros sed, finibus diam. Sed et ligula tincidunt arcu elementum iaculis ac ac lacus. Nullam eget feugiat eros. Proin egestas tellus nunc, id sagittis neque elementum ut. In hac habitasse platea dictumst. Pellentesque purus lacus, commodo sed auctor et, vehicula non ipsum. Nullam sagittis ornare felis, in euismod ex tempor eget. Ut mattis neque lacus. Sed pretium dolor eget rutrum sollicitudin. In cursus faucibus faucibus. Nullam vel efficitur metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id urna arcu. Mauris euismod lobortis mi quis viverra. Sed convallis turpis at diam volutpat ullamcorper. Aenean consequat eu arcu ut faucibus.");
	x_gui_update_textbox("Notice that if the text is longer than the textbox, it overflows onto the next text slide.");
	x_gui_update_textbox("Let's play around with some settings! Click the left MENU tab to expand the menu.");
	x_gui_update_textbox("Open 'Options' and play with the levels. You can even choose to mute all sound! When you're done. Go ahead and restart the game. You'll notice that it loads up with the options you had previously set!");
	x_gui_update_textbox("(I'll also remember that you've read all this before!)");
} else {
	x_gui_update_textbox("Hey![pause:30] Your game file looks like you've been here before[pause:30].[pause:30].[pause:30].[pause:30] Welcome back!");	
}