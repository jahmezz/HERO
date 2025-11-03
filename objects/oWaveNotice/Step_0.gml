if (fade_in) {
    alpha += 0.02;
    if (alpha >= 1) {
        alpha = 1;
        fade_in = false;
    }
} else {
    alpha -= 0.01;
    if (alpha <= 0) instance_destroy(); // remove after fade-out
}