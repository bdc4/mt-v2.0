/// @description  Get an event ds_map given the event table and the event value
/// @function  x_eve_get
/// @param  table
/// @param  event

var table = EVENTS_TABLE[? argument0];
var events = table[? "events"];
for (var i=0; i<ds_list_size(events); i++) {
	var event = events[| i];
	if event[? "name"] == argument1
		return event;
}

return show_error("Event not found! Table: "+string(argument0)+" Event String: "+string(argument1),false);