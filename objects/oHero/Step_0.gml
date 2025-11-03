if (instance_exists(oHelpOverlay)) {
    var overlay = instance_find(oHelpOverlay, 0);
    if (overlay.visible) exit; // skip world updates while paused
}


if (!dead) {
    var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
    var my = keyboard_check(vk_down) - keyboard_check(vk_up);

    var acc = 0.2;
    xspd = lerp(xspd, mx * 4, acc);
    yspd = lerp(yspd, my * 4, acc);

    x += xspd;
    y += yspd;
} else {
    // When dead: shake and blink
    blink_timer += 1;
    shake = max(0, shake - 0.5);
    if (blink_timer > 120) {
		visible = false;        // hides the hero
	}
}

float_t += 0.05;
glow_phase += 0.03; // new

// --- keep hero inside room bounds ---
var margin = 8; // optional padding so you don't stick to edge

x = clamp(x, margin, room_width - margin);
y = clamp(y, margin, room_height - margin);