#region Player Inputs

// keyboard inputs
if (!instance_exists(oFade)) {
	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	jump = keyboard_check_pressed(vk_space);
	jump_held = keyboard_check(vk_space);
	attack = keyboard_check_pressed(vk_shift);
} else {
	left = 0;
	right = 0;
	jump = 0;
	jump_held = 0;
	attack = 0;
}


#endregion


#region Calculate Movement

walljump_delay = max(walljump_delay-1, 0);

if (walljump_delay == 0) {
		var _dir = right - left;
	hsp += _dir * walk_spd * accel;
	hsp = min(abs(hsp), max_walk_spd) * sign(hsp);
	if (_dir == 0) {
		if hsp < 0 {
			hsp = min(hsp + decel, 0)
		} else {
			hsp = max(hsp - decel, 0)
		}
	};

	if (on_wall != 0 && !on_ground && jump) {
		if (!audio_is_playing(sndJump)) {
			audio_play_sound(sndJump, 1, false);
		}
		walljump_delay = walljump_delay_max;
		hsp = -on_wall * hsp_wjump;
		vsp = jump_spd_wall;
	}
}


var _grv_final = grv;
if (on_wall != 0 && vsp > 0) {
	_grv_final = grv_wall;
}
vsp += _grv_final;

if (coyote_timer > 0) {
	coyote_timer -= 1;
	if (jump && (on_ground || coyote_timer > 0)) {
		vsp = jump_spd;
		if (!audio_is_playing(sndJump)) {
			audio_play_sound(sndJump, 1, false);
		}
		on_ground = false;
	}
	coyote_timer = max(0, coyote_timer);
}

if (vsp < 0 && !jump_held) {
	vsp = max(vsp, jump_spd/3);
}

#endregion


#region Collision

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

#endregion


#region Current Status

on_ground = place_meeting(x, y + ground_buffer, oBlock);
if (on_ground) {
	coyote_timer = coyote_timer_initial;
}

on_wall = place_meeting(x+1, y, oBlock) - place_meeting(x-1, y, oBlock);

#endregion


#region Animations

image_speed = 1;
if (hsp != 0) image_xscale = sign(hsp);
if (!on_ground) {
	if (on_wall != 0 && vsp > 0) {
		sprite_index = sPlayerWall;	
	} else {
		image_speed = 0;
		sprite_index = sPlayerAir;
		if (vsp < 0) image_index = 1;
		else image_index = 0;
	}
	
} else {
	if  (hsp != 0) {
		if (!audio_is_playing(sndStep)) {
			audio_play_sound(sndStep, 1, false);
		}
		sprite_index = sPlayerRun;
	} else {
		sprite_index = sPlayer;
	}
}

#endregion


#region Attack
if (attack_cooldown > 0) {
	attack_cooldown = max(0, attack_cooldown-1);
} else {
	if (attack) {
		attack_cooldown = attack_max;
		instance_create_layer(x, y, "Weapon", oWeapon);
	}
}

#endregion

#region Debug

if (keyboard_check(vk_enter)) {
	game_restart();
}

#endregion
