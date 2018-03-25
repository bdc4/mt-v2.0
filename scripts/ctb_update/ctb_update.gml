/// @description  ctb_update()
/// @function  ctb_update
/*
    +--------------------------------------------------+
    |               Ced's Textbox                      |
    +--------------------------------------------------+
    | Author: Cedrik Dubois [ CedSharp ]               |
    |                                                  |
    | Description:                                     |
    |   An extension that make use of textbox easier,  |
    |   for any game, fully customizable.              |
    +--------------------------------------------------+
    
    This script will update the textbox.
    Simply call this somewhere in the step event of the textbox object.
    
    NOTE: If invisible, this script will not run.
          If you want to hide the textbox, make it invisible.
          You can make it resume by making it visible again.
*/
if( !visible ) exit;

var inArea = point_in_rectangle(mouse_x,mouse_y,0,room_height-sprite_height/4,sprite_width,room_height);
var skip = keyboard_check_pressed(CTB_SkipKey) or ((mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height) and object_index == obj_textbox));

if( !pause ) {

    if( current_message == noone ) {
        if( !ds_queue_empty( messages ) ) {
            current_message = ds_queue_dequeue( messages );
            current_word = 0;
            current_pos = 1;
            end_x = 0;
            end_y = 0;
            is_typing = true;
            is_finished = false;
        }
    }
    
    if( current_message != noone ) {
        
        if( current_word < ds_list_size( current_message ) ) {
            var me = current_message[| current_word];
			
            if( me[0] == "word" ) {
                if( current_pos < string_length( me[5] ) && me[5] != " " ) {
                    current_pos += text_speed;
                    if( floor( current_pos+1 ) <= string_length( me[5] ) ) {
                        if( string_copy( me[5],floor( current_pos ),2 ) == "\\#" ) current_pos++;
					}
					
                }
                else {
					if (me[5] != "." and me[5] != " " and object_index == obj_textbox) audio_play_sound(snd_talk_system,100,false);
                    current_word++;
					
                    while( current_word < ds_list_size( current_message ) ) {
                        current_pos = 1;
                        me = current_message[| current_word];
                        
                        if( me[0] == "word" ) break;
                        else {
							
                            if( ds_map_exists( CTB_Commands, me[0] ) ) {
                                var scr = CTB_Commands[? me[0]];
                                if( script_exists( scr ) ) script_execute( scr, me[1] );
                            }
                        }
                        current_word++;
                    }
                }
            }
            else {
                if( ds_map_exists( CTB_Commands, me[0] ) ) {
                    var scr = CTB_Commands[? me[0]];
                    if( script_exists( scr ) ) script_execute( scr, me[1] );
                }
                current_word++;
            }
        }
        
        if( current_word >= ds_list_size( current_message ) ) {
            me = current_message[| ds_list_size( current_message )-1];
            if( me[0] == "word" ) {
                if( current_pos == string_length( me[5] ) ) {
                    current_word = ds_list_size( current_message );
                    if( skip or inArea) {
                        if( ds_queue_empty( messages )) { 
						
							if inArea {
								if skip {
									if !fadeOut exit;
									x_gui_maximize_textbox();
									fadeOut = false;
									exit;		
								}
								if fadeOut {
									x_gui_maximize_textbox();
									fadeOut = false;
									exit;
								}
							}
							
							//Minimize
							if (!fadeOut) and !inArea {
								x_gui_minimize_textbox();
								fadeOut = true;
								exit;
							}
							
							//Maximize
							else if fadeOut and !inArea  {
								x_gui_maximize_textbox();
								fadeOut = false;
								exit;
							}

						}
						else
                        {
                            current_message = ds_queue_dequeue( messages );
                            current_word = 0;
                            current_pos = 1;
                        }
                    }
                }
            }
            else if( skip and !inArea) {
                //if( ds_queue_empty( messages ) ) instance_destroy();
                //else
                {
                    current_message = ds_queue_dequeue( messages );
                    current_word = 0;
                    current_pos = 1;
                }
            }
        }
        else if( skip and !inArea)
        {
            while( current_word < ds_list_size( current_message ) ) {
                me = current_message[| current_word];
                if( me[0] != "word" ) {
                    if( ds_map_exists( CTB_Commands, me[0] ) ) {
                        var scr = CTB_Commands[? me[0]];
                        if( script_exists( scr ) ) script_execute( scr, me[1] );
                    }
                }
                current_word++;
            }
            
            current_word = ds_list_size( current_message )-1;
            me = current_message[| current_word];
            if( me[0] == "word" ) {
                current_pos = string_length( me[5] );
            }
            else current_pos = 2;
            current_word++;
        }
        
    }
}
else {
    pause_timer--;
    if( pause_timer <= 0 || skip ) pause = false;
}

var delay = ( 1000/room_speed ) * ( 1/icon_speed );
if( current_time-icon_last >= delay ) {
    icon_frame++;
    icon_last += delay;
}