// inputs
left = 0;
right = 0;
jump = 0;
jump_held = 0;

// speed
hsp = 0;
vsp = 0;
grv = 0.5;
jump_spd = -10;
walk_spd = 3;
max_walk_spd = 4;
accel = 0.4;
decel = 0.3;

coyote_timer_initial = 7;
coyote_timer = coyote_timer_initial;
on_ground = false;
ground_buffer = 10;

// wall
on_wall = 0;
grv_wall = 0.1;
hsp_wjump = 4;
jump_spd_wall = -9;
walljump_delay = 0;
walljump_delay_max = 20;