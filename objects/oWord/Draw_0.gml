var col;
switch (word_text) {
    case "HATE": case "LIES": col = make_color_rgb(255,80,80); break;
    case "LOVE": case "HOPE": col = make_color_rgb(150,255,180); break;
    default: col = make_color_rgb(180,160,255); break;
}
draw_set_color(col);
draw_text(x, y, word_text);
draw_set_color(c_white);