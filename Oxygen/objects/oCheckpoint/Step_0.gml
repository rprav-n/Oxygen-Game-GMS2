if (global.checkpoint_id == id) {
	image_index = 1;
} else {
	image_index = 0;
	if (place_meeting(x, y, oPlayer)) {
		global.checkpoint_room = room;
		global.checkpoint_x = x;
		global.checkpoint_y = y;
		global.checkpoint_id = id;
		show_debug_message(global.infinite_jumps);
		savegame();
		
		if (!audio_is_playing(sndCheckpoint)) {
			audio_play_sound(sndCheckpoint, 1, false);
		}
		
		screenshake(5, 20);
	}
}


if (place_meeting(x, y, oPlayer)) {
	text_fade = 1;
} else {
	if (text_fade > 0){
		text_fade -= 0.02;
	}
}