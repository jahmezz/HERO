var player = instance_nearest(x, y, oHero);

if (!fading && instance_exists(player)) {
    var near = (point_distance(x, y, player.x, player.y) < 60);

    if (near && keyboard_check_pressed(vk_space)) {
        global.letters += letter_reward;

        // spawn floating letter indicator
        var ind = instance_create_layer(x, y - 20, "Instances", oLetterPopup);
        ind.amount = letter_reward;

        spoken = true;
        fading = true;
    }
}

// --- Fade out handling ---
if (fading) {
    fade_alpha -= 0.02; // match oLetterPopup fade speed (≈2 seconds)

    if (betrayed) {
        line_visible_timer += 1;
        // float up gently during the fade
        y -= 0.1; 
    }

    if (fade_alpha <= 0) instance_destroy();
}