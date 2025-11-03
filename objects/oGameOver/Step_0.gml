if (alpha < 1) alpha += fade_speed;

// restart key
if (keyboard_check_pressed(vk_enter)) {
    room_restart();
}