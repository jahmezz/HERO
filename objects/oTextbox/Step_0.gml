if (visible) {
    alpha = min(alpha + 0.1, 1);
    timer -= 1;
    if (timer <= 0) {
        visible = false;
        follow_id = noone;
    }
} else {
    alpha = max(alpha - 0.1, 0);
}

