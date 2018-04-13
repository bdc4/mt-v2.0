/// @description Insert description here
// You can write your code in this editor

//Control Time
if !PAUSED {
	clock++;
	
	if clock > 4*game_get_speed(gamespeed_fps) {
		
		clock = 0;
		
		if timeofday < 2 { 
			timeofday++;
		} else {
			timeofday = 0;
			DATE++;
		}
	}
}