if (alpha > 0 && instance_exists(follow_id)) {
    var bx = follow_id.x + 10;  // shift right
    var by = follow_id.y - 60;  // lift higher above head
    by -= sin(current_time / 200) * 2; // gentle float

    var text_w = string_width(text) + 12;
    var text_h = 28;

    draw_set_alpha(alpha * 0.8);
    draw_set_color(make_color_rgb(20, 20, 20));
    draw_rectangle(bx - text_w/2, by - text_h, bx + text_w/2, by, false);

    draw_set_alpha(alpha);
    draw_set_color(c_white);
    draw_text(bx - text_w/2 + 6, by - text_h + 8, text);

    draw_set_alpha(1);
    draw_set_color(c_white);
}