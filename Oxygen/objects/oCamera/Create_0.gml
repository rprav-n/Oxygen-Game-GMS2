cam = view_camera[0];
cam_spd = 10;
follow = oPlayer;
view_w_half = camera_get_view_width(cam)/2;
view_h_half = camera_get_view_height(cam)/2;
xTo = x;
yTo = y;

// screen shake
shake_magnitude = 5;
shake_length = 0;
shake_remain = 0;
buff = 32;