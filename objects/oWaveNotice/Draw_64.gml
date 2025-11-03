draw_set_alpha(alpha);
draw_set_color(c_white);
var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;
draw_text_transformed_color(cx - 120, cy - 20, text, 1.6, 1.6, 0,
                            c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(cx - 150, cy + 20, "You are encouraged.", 1.6, 1.6, 0,
                            c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_set_alpha(1);