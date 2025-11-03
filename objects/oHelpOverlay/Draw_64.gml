if (alpha > 0.01) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    draw_set_alpha(alpha * 0.9);
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(0, 0, gui_w, gui_h, false);

    draw_set_alpha(alpha);
    draw_set_color(c_white);

    var cx = gui_w / 2;
    var cy = gui_h / 2;

    draw_text_transformed_color(cx - 200, cy - 120,
        "HOW TO PLAY\n\n" +
        "[ARROWS]  Move\n" +
		"[SPACE]   Talk to friends\n" +
		"[TYPE]    Type words you see to destroy them\n" +
		"[ENTER]   Submit word\n" +
		"[ESC]     Show / Hide controls",
        1.3, 1.3, 0,
        c_white, c_white, c_white, c_white, 1);

    draw_text(cx - 60, cy + 150, "Press [ESC] to close");
    draw_set_alpha(1);
}