if (distance_to_point(mouse_x, mouse_y) <= 0) {
	if (!hover) {
		audio_play_sound(sndButtonHover, 1, false);
	}
	hover = true;
	
	if (mouse_check_button_pressed(mb_any)) {
		if (!audio_is_playing(sndButtonClick)) {
			audio_play_sound(sndButtonClick, 1, false);
		}

		fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
	}
} else {
	hover = false;
}