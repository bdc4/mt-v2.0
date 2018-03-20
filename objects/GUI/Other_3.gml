/// @description Insert description here
// You can write your code in this editor
ini_open("config.ini");
ini_write_real("Options", "MUSIC_VOL", MUSIC_VOL);
ini_write_real("Options", "SFX_VOL", SFX_VOL);
ini_write_real("Options", "MUTE_ALL", MUTE_ALL);
ini_close();