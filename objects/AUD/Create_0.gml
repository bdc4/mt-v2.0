/// @description Insert description here
// You can write your code in this editor
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

music_playing = msc_hub_theme;
music = [msc_hub_theme];
sfx = [snd_gun];

music_volume = 1;
sfx_volume = 1;

control = false;
music_target = 0;
sfx_loaded = false;

