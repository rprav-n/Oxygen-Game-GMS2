off_text = "OFF"
on_text = "ON"

if (!global.infinite_jumps) {
	text = off_text;
} else {
	text = on_text;
}


x1 = x - (sprite_width/2);
y1 = y - (sprite_height/2);
x2 = x + (sprite_width/2);
y2 = y + (sprite_height/2);

hover = false;

explain = "UNLIMITED JUMPS:\nturn this option ON if you want to\njump around in the air."