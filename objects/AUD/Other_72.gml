/// @description Insert description here
// You can write your code in this editor
if (audio_group_is_loaded(audiogroup_music)) {
	
	audio_play_sound(music_playing,1000,true);
	var startVol = GUI.MUTE_ALL ? 0 : GUI.MUSIC_VOL/100;
	audio_group_set_gain(audiogroup_music, startVol, 0);
	control = true;
}
if (audio_group_is_loaded(audiogroup_sfx)) {
	audio_group_set_gain(audiogroup_sfx, GUI.SFX_VOL/100, 0);
	sfx_loaded = true;
}