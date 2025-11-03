if (keyboard_check_pressed(vk_escape)) {
    global.game_paused = !global.game_paused;
	visible = !visible;
}

// smooth fade animation
alpha = lerp(alpha, global.game_paused ? 1 : 0, 0.1);