var glow = alpha + sin(pulse) * 0.2;

draw_set_alpha(clamp(glow, 0.1, 1));
draw_set_color(make_color_rgb(200, 220, 255));
draw_circle(x, y, size, false);
draw_set_alpha(1);
draw_set_color(c_white);