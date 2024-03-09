if (global.checkpoint_id == id) {
	image_index = 1;
} else {
	image_index = 0;
	if (place_meeting(x, y, oPlayer)) {
		global.checkpoint_room = room;
		global.checkpoint_x = x;
		global.checkpoint_y = y;
		global.checkpoint_id = id;
	}
}


if (place_meeting(x, y, oPlayer)) {
	text_fade = 1;
} else {
	if (text_fade > 0){
		text_fade -= 0.02;
	}
}