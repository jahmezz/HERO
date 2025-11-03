var t = current_time * 0.002; // adjust speed
var hint_alpha = 0.4 + 0.3 * sin(t); // oscillates between 0.1–0.7 roughly

if (instance_exists(oHelpOverlay)) {
    var overlay = instance_find(oHelpOverlay, 0);
    if (!overlay.visible) {
		draw_set_alpha(hint_alpha);
		draw_set_color(c_white);
		draw_text(display_get_gui_width()/2 - 120,
		           display_get_gui_height() - 60,
		           "Press [ESC] anytime for controls");
		draw_set_alpha(1);
	}
}

draw_set_color(c_white);
draw_text(20, 20, "Typed Word: " + string(global.typed));
draw_text(20, 40, "Courage Ammo: " + string(global.letters));

// if out of letters
if (global.flash_timer > 0) {
    draw_set_color(c_red);
    draw_text(room_width / 2 - 80, 40, "NO COURAGE!");
    draw_set_color(c_white);
    global.flash_timer -= 1;
}

var remaining = max(global.enemies_per_wave - global.enemies_killed, 0);
draw_set_color(c_white);
draw_text(20, 60, "Wave: " + string(global.wave_number));
draw_text(20, 80, "Enemies left: " + string(remaining) + " / " + string(global.enemies_per_wave));