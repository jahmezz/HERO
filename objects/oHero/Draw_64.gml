/// oHero → Draw GUI

// --- GUI position mapped to hero ---
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var gui_x = (x / room_width) * gui_w;
var gui_y = (y / room_height) * gui_h;

// --- Show currently typed word ---
if (global.typed != "") {
    var t = current_time * 0.005;
    var pulse = 0.8 + 0.2 * sin(t);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(merge_color(c_white, c_yellow, pulse));
    draw_text_transformed(gui_x, gui_y - 10, string(global.typed), 1.0, 1.0, 0);
}

// --- "NO COURAGE!" warning near hero ---
if (global.flash_timer > 0) {
    // fade the timer automatically
    global.flash_timer -= 1;

    var alpha = clamp(global.flash_timer / 30, 0, 1);
    draw_set_alpha(alpha);

    // oscillate a bit for attention
    var wobble = 2 * sin(current_time * 0.02);
    draw_set_color(c_red);

    draw_text_transformed(gui_x + wobble, gui_y - 20, "NO COURAGE!", 1.0, 1.0, 0);

    draw_set_alpha(1);
    draw_set_color(c_white);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
