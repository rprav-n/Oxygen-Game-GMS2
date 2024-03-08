// keyboard inputs
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);
jump_held = keyboard_check(vk_space);

// calculate movement
var _dir = right - left;
hsp += _dir * walk_spd * accel;
hsp = min(abs(hsp), max_walk_spd) * sign(hsp);
if (_dir == 0) {
	hsp = lerp(hsp, 0, decel);
};

vsp += grv;

if (coyote_timer > 0) {
	coyote_timer -= 1;
	if (jump && (on_ground || coyote_timer > 0)) {
		vsp = jump_spd;
		on_ground = false;
	}
	coyote_timer = max(0, coyote_timer);
}

if (vsp < 0 && !jump_held) {
	vsp = max(vsp, jump_spd/3);
}


// collisions
if (place_meeting(x + hsp, y, oBlock)) {
	var _onepixel = sign(hsp);
	while (!place_meeting(x + _onepixel, y, oBlock)) {
		x += _onepixel ;
	}
	hsp = 0;
}
x += hsp;


if (place_meeting(x, y + vsp, oBlock)) {
	var _onepixel = sign(vsp);
	while (!place_meeting(x, y + _onepixel, oBlock)) {
		y += _onepixel ;
	}
	vsp = 0;
}
y += vsp;

// status
on_ground = place_meeting(x, y + ground_buffer, oBlock);
if (on_ground) {
	coyote_timer = coyote_timer_initial;
}

// animation
if (_dir != 0) {
	sprite_index = sPlayerRun;
	var _facing = sign(_dir);
	image_xscale = _facing;
} else {
	sprite_index = sPlayer;
}
if (vsp != 0) {
	sprite_index = sPlayerAir;
	if (vsp < 0) image_index = 1;
	else image_index = 0;
}





// debug
if (keyboard_check(vk_enter)) {
	game_restart();
}


