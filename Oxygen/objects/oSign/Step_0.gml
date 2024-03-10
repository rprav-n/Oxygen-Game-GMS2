if (place_meeting(x, y, oPlayer)) {
	text_fade = 1;
} else {
	if (text_fade > 0){
		text_fade -= 0.02;
	}
}