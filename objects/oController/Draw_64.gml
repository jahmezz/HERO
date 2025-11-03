/// oController → Draw GUI
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Scale factor relative to base size (useful for text scaling)
var gui_scale = min(gui_w / global.base_gui_w, gui_h / global.base_gui_h);

// You can use this later for dynamically scaling font size or positioning

// --- Pulsing ESC hint ---
var t = current_time * 0.002;
var hint_alpha = 0.4 + 0.3 * sin(t);

// position anchored to bottom center, scaled safely
var hint_x = gui_w * 0.5 - 105 * gui_scale;
var hint_y = gui_h - 60 * gui_scale;

if (instance_exists(oHelpOverlay)) {
    var overlay = instance_find(oHelpOverlay, 0);
    if (!overlay.visible) {
        draw_set_alpha(hint_alpha);
        draw_set_color(c_white);
        draw_text_transformed(hint_x, hint_y, "Press [ESC] anytime for controls", gui_scale, gui_scale, 0);
        draw_set_alpha(1);
    }
}

// --- HUD text (top-left, scaled) ---
draw_set_color(c_white);
draw_text_transformed(20 * gui_scale, 20 * gui_scale, "Typed Word: " + string(global.typed), gui_scale, gui_scale, 0);
draw_text_transformed(20 * gui_scale, 40 * gui_scale, "Courage: " + string(global.letters), gui_scale, gui_scale, 0);

// Flash "NO COURAGE"
if (global.flash_timer > 0) {
    draw_set_color(c_red);
    draw_text_transformed(gui_w * 0.5 - 80 * gui_scale, 40 * gui_scale, "NO COURAGE!", gui_scale, gui_scale, 0);
    draw_set_color(c_white);
    global.flash_timer -= 1;
}

// Wave info
var remaining = max(global.enemies_per_wave - global.enemies_killed, 0);
draw_text_transformed(20 * gui_scale, 60 * gui_scale, "Wave: " + string(global.wave_number), gui_scale, gui_scale, 0);
draw_text_transformed(20 * gui_scale, 80 * gui_scale,
    "Obstacles left: " + string(remaining) + " / " + string(global.enemies_per_wave),
    gui_scale, gui_scale, 0);