/// @description Insert description here
// You can write your code in this editor
globalvar EVENTS_TABLE, EVENT_NAME, EVENT_ACTIONS, EVENT_TEXT;

EVENT_NAME = "";
EVENT_TEXT = "";
EVENT_ACTIONS = [];
EVENTS_TABLE = ds_map_create();

eveNameList = ["PIRATES","TRADER","ROCKS","BROKEN_ANKLE"];
eveActList = [["Attack", "Talk", "Run"],["Talk", "Ignore"], ["OK"], ["OK"]];

var file = file_text_open_read(working_directory+"\events.json");
var requestResult = "";
while !file_text_eof(file) { 
	requestResult += file_text_readln(file);
}
//show_debug_message("Events Text: "+string(requestResult));

var resultMap = json_decode(requestResult);
show_debug_message("Results Map: "+string(resultMap)+" IS DS_MAP: "+string(ds_exists(resultMap, ds_type_map)));

var resultList = ds_map_find_value(resultMap, "default");
show_debug_message("Results List: "+string(resultList)+" IS DS_LIST: "+string(ds_exists(resultList, ds_type_list)));

for (var i=0; i<ds_list_size(resultList); i++) {
	show_debug_message("Result List @ index "+string(i)+": "+string(resultList[| i]));
	
	var tableName = ds_map_find_value(resultList[| i], "table_name");
	show_debug_message("Table Name: "+string(tableName));
	
	EVENTS_TABLE[? tableName] = resultList[| i];
	
/*
	var j = ds_map_find_first(resultList[| i]);

	while j != undefined {
		show_debug_message("Key: "+string(j)+" Val: "+string(resultList[| j]));
		var zMap = resultList[| j];
		var z = is_undefined(zMap) ? undefined : ds_map_find_first(zMap);
		while z != undefined {
			show_debug_message("SUBMAP Key: "+string(z)+" Val: "+string(zMap[? z]));
			z = ds_map_find_next(zMap, z);
		}
	
		j = ds_map_find_next(resultMap, j);
	}
	*/
}

var test_event = x_eve_get("MEETINGS", "Space Pirates!");
show_debug_message("TEST EVENT on MEETINGS: "+string(test_event[? "name"]));