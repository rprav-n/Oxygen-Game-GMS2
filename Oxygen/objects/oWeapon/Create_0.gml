screenshake(4, 10);

timer = 8;
image_index = irandom_range(0, image_number - 1);
flipped = choose(1, 2);

if flipped == 2 {
	image_xscale = -1;
}