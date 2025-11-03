// float and shake offsets
var float_y = sin(float_t) * 3;
var shake_x = 0;
var shake_y = 0;

if (dead) {
    shake_x = irandom_range(-shake, shake);
    shake_y = irandom_range(-shake, shake);

    // blinking red
    if ((blink_timer div 5) mod 2 == 0) {
        draw_set_color(c_red);
    } else {
        draw_set_color(c_black);
    }

    draw_text_transformed(x + shake_x, y + float_y + shake_y, word_display, 1, 1, sin(float_t) * 2);
    draw_set_color(c_white);
    exit; // stop here; no aura when dead
}



// -------- hero main text --------
draw_set_alpha(1);
draw_set_color(hero_color);
draw_text_transformed(x, y + float_y, word_display, 1, 1, sin(float_t) * 2);

// reset
draw_set_color(c_white);
draw_set_alpha(1);