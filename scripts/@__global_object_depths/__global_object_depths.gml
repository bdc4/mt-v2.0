// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // ui_defaults
global.__objectDepths[1] = 0; // ui_label
global.__objectDepths[2] = 0; // ui_button_ani
global.__objectDepths[3] = 0; // ui_listbox_ext
global.__objectDepths[4] = 0; // ui_listbox
global.__objectDepths[5] = 0; // ui_image
global.__objectDepths[6] = 0; // ui_button
global.__objectDepths[7] = 0; // ui_bubble
global.__objectDepths[8] = 0; // ui_label_score
global.__objectDepths[9] = 0; // ui_editbox
global.__objectDepths[10] = 123321; // ui_dialog
global.__objectDepths[11] = 0; // ui_combobox
global.__objectDepths[12] = 0; // ui_checkgroup
global.__objectDepths[13] = 0; // ui_checkbox
global.__objectDepths[14] = 0; // ui_textbox
global.__objectDepths[15] = 0; // ui_textani
global.__objectDepths[16] = 0; // ui_toggle
global.__objectDepths[17] = 0; // ui_slider
global.__objectDepths[18] = 123321; // ui_panel
global.__objectDepths[19] = 0; // ui_listbox_horz
global.__objectDepths[20] = 0; // ui_gauge
global.__objectDepths[21] = 0; // ui_keyboard
global.__objectDepths[22] = 0; // ui_ani_control
global.__objectDepths[23] = 0; // ui_swipe


global.__objectNames[0] = "ui_defaults";
global.__objectNames[1] = "ui_label";
global.__objectNames[2] = "ui_button_ani";
global.__objectNames[3] = "ui_listbox_ext";
global.__objectNames[4] = "ui_listbox";
global.__objectNames[5] = "ui_image";
global.__objectNames[6] = "ui_button";
global.__objectNames[7] = "ui_bubble";
global.__objectNames[8] = "ui_label_score";
global.__objectNames[9] = "ui_editbox";
global.__objectNames[10] = "ui_dialog";
global.__objectNames[11] = "ui_combobox";
global.__objectNames[12] = "ui_checkgroup";
global.__objectNames[13] = "ui_checkbox";
global.__objectNames[14] = "ui_textbox";
global.__objectNames[15] = "ui_textani";
global.__objectNames[16] = "ui_toggle";
global.__objectNames[17] = "ui_slider";
global.__objectNames[18] = "ui_panel";
global.__objectNames[19] = "ui_listbox_horz";
global.__objectNames[20] = "ui_gauge";
global.__objectNames[21] = "ui_keyboard";
global.__objectNames[22] = "ui_ani_control";
global.__objectNames[23] = "ui_swipe";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for