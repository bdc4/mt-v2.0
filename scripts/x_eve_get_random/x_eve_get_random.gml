/// @description  Get an event ds_map given the event table and the event value
/// @function  x_eve_get_random
/// @param  table

var table = EVENTS_TABLE[? argument0];
var events = table[? "events"];
var i = irandom_range(0, ds_list_size(events)-1)
var event = events[| i];

return event;
