/// @description Insert description here
// You can write your code in this editor
globalvar EVENTS, EVENT_NAME, EVENT_ACTIONS;

EVENT_NAME = "";
EVENT_ACTIONS = [];
EVENTS = ds_map_create();

eveNameList = ["Space Pirates!", "Wandering Merchant", "Meteors!", "Broken Ankle"];
eveActList = [["Attack", "Talk", "Run"],["Talk", "Ignore"], ["OK"], ["OK"]];

for (var i=0; i<array_length_1d(eveNameList); i++) {
	var _event = ds_map_create();
	_event[? "name"] = eveNameList[i];
	_event[? "actions"] = eveActList[i];
	
	EVENTS[? eveNameList[i]] = _event;
}