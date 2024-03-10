function initialize(){
	global.checkpoint_room = rLevel1;
	global.checkpoint_x = 128;
	global.checkpoint_y = 230;
	global.checkpoint_id = noone;
	global.invin_enemies = false;
	global.invin_hazards = false;
	global.infinite_jumps = false;

	// play music
	if (!audio_is_playing(sndMusic)) {
		audio_play_sound(sndMusic, 1, true);
	}
	
	window_set_cursor(cr_default);
}