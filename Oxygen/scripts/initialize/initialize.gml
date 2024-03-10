function initialize(){
	global.checkpoint_room = rLevel1;
	global.checkpoint_x = 128;
	global.checkpoint_y = 230;
	global.checkpoint_id = noone;

	// play music
	if (!audio_is_playing(sndMusic)) {
		audio_play_sound(sndMusic, 1, true);
	}

	room_goto(rLevel1);
}