/*
    Read the scripts, they contain all the required information about
    all the below functions.
*/
alarm_set(0,240);
#region Textbox Area & Easing
xx = camera_get_view_width(view_camera[0]);
yy = camera_get_view_height(view_camera[0]);

alertboxArea = [room_width*3/4-300,-60,room_width*3/4,0];
ab_easing = ds_map_create();
#endregion

// Initialize the CTB engine
ctb_init();
msg = "";
fadeOut = false;

// Mark this object as being a textbox
ctb_create();
x_gui_maximize_alertbox();

// Add some icons
icon_typing = spr_ico_typing_small;
icon_finished = spr_ico_continue_small;

// Add some colors
ctb_add_color( "default", c_white );
ctb_add_color( "white", c_white );
ctb_add_color( "blue", c_blue );
ctb_add_color( "yellow", c_yellow );
ctb_add_color( "red", c_red );

// Add some fonts
ctb_add_font( "default", GUI.tbFont );
ctb_add_font( "normal", GUI.tbFont );
ctb_add_font( "other", f_other );

// Add a sound
ctb_add_sound( "gun", snd_gun );

// Add a custom command to change character image!
char_sprite = spr_char;
ctb_add_command( "char", command_char );

// Set the padding of the textbox
// We add a big left padding to insert a character sprite in rhw textbox
ctb_set_padding( 10,10,10,10 );

// Set the textbox's background
sprite_index = ctb_load_subimage( spr_textbox_slice9_subimages, 300, alertboxArea[3]-alertboxArea[1]);

alertOpen = false;
// Add some text in the textbox.

/* */
/*  */



