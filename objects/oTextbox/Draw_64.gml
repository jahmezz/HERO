if (alpha > 0) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var box_w = string_width(text) + 40;
    var box_h = 40;

    var bx = (gui_w - box_w) / 2;
    var by = gui_h - 100;

    draw_set_alpha(alpha * 0.8);
    draw_set_color(make_color_rgb(20, 20, 20));
    draw_rectangle(bx, by, bx + box_w, by + box_h, false);

    draw_set_color(c_white);
    draw_set_alpha(alpha);
    draw_text(bx + 20, by + 12, text);

    draw_set_alpha(1);
}