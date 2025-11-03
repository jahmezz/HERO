draw_set_alpha(alpha);
draw_set_color(c_yellow);

if (variable_instance_exists(id, "message")) {
    draw_text(x - string_width(message) / 2, y, message);
} else {
    draw_text(x - 10, y, "+" + string(amount) + " Courage");
}

draw_set_alpha(1);