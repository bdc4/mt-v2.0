/// @description Insert description here
// You can write your code in this editor

//Draw Date/Time
draw_sprite(backSprite,0,room_width*11/12-80,8);
draw_set_valign(fa_middle);
var textcolor = !PAUSED ? c_white : c_gray;
draw_set_color(textcolor);

draw_set_halign(fa_left);
draw_text(room_width*11/12-64, 32, "Day "+string(DATE));

draw_set_halign(fa_center);
draw_text(room_width*11/12+64, 32, string(TIME[timeofday]));
