hsp = dir * walk_spd;

if (place_meeting(x + hsp, y, oBlock)) {
	var _onepixel = sign(hsp);
	while(!place_meeting(x+_onepixel, y, oBlock)) {
		x += _onepixel;
	}
	dir = -dir;
}

x += hsp