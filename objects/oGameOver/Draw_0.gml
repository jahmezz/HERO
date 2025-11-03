// --- Dim the background ---
draw_set_alpha(alpha * 0.6); // semi-transparent veil
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(alpha);
draw_set_color(c_red);
draw_set_font(-1); // or your default font

var msg = "GAME OVER";
var sub = "Press ENTER to restart";

draw_text_transformed(room_width/2 - string_width(msg)/2, room_height/2 - 40, msg, 2, 2, 0);
draw_set_color(c_white);
draw_text(room_width/2 - string_width(sub)/2 + 40, room_height/2 + 30, sub);
draw_set_alpha(1);