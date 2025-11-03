/// oNPC → Draw

// Fade and color setup
draw_set_alpha(fade_alpha);

if (fading && betrayed) {
    draw_set_color(make_color_rgb(160, 0, 0)); // dark red tone for betrayal fade
} else {
    draw_set_color(make_color_rgb(255, 230, 200)); // normal warm tone
}

// Draw name
draw_text(x - string_width(name_tag)/2, y - 32, name_tag);

// Heart icon
draw_set_color(c_white);
draw_text(x - string_width("♥")/2, y - 16, "♥");

// --- Dialogue / Betrayal line ---
// --- Dialogue / Betrayal line ---
if (spoken || betrayed) {
    var text_color = c_yellow;
    if (betrayed) text_color = make_color_rgb(200, 40, 40); // dark red

    draw_set_color(text_color);
    draw_text(x - string_width(line)/2, y - 60 - line_visible_timer * 0.2, line);
}

// --- Near indicator ---
var player = instance_nearest(x, y, oHero);
if (!fading && instance_exists(player)) {
    if (point_distance(x, y, player.x, player.y) < 60) {
        draw_set_color(c_yellow);
        var b = 14;
        draw_rectangle(x - b, y - b, x + b, y + b, false);
        draw_set_color(c_white);
        draw_text(x - string_width("[SPACE]")/2, y - 64, "[SPACE]");
    }
}

draw_set_alpha(1);
