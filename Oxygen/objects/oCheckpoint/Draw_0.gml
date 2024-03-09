draw_self();
draw_set_font(fDefault);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _text_w_half = string_width(text)/2 + padding;
var _text_h_half = string_height(text)/2;

if (text_fade > 0) {
	draw_set_alpha(text_fade);
	draw_set_color(c_aqua);
	draw_rectangle(x-_text_w_half, y-_text_h_half - text_y, x+_text_w_half, y+_text_h_half - text_y, 0);
	draw_set_color(c_black);
	draw_text(x, y - text_y, text);
}

draw_set_alpha(1);