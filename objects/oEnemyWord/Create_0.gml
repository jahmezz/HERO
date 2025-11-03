/// oEnemyWord → Create
y_offset = 0;

// 🩸 Modern “inner enemy” words — things people actually fight within
var evil_words = [
    "FEAR","DOUBT","ANXIETY","GUILT","SHAME","STRESS","ANGER",
    "PRESSURE","FAILURE","LONELINESS","REGRET","PAIN","LOSS",
    "RESENTMENT","CONTROL","JUDGMENT","ISOLATION","COMPARISON",
    "DESPAIR","HATRED","ENVY","NEGLECT","BURDEN","REJECTION"
];

// pick one
word_text = evil_words[irandom(array_length(evil_words) - 1)];

// 💠 Emotional color families
switch (word_text) {
    // 🔴 Anger / Hatred / Control — red-hot
    case "ANGER":
    case "HATRED":
    case "RESENTMENT":
    case "CONTROL":
        color = make_color_rgb(irandom_range(230,255), irandom_range(60,100), irandom_range(60,90));
        break;

    // 🟣 Fear / Anxiety / Despair — violet-blue
    case "FEAR":
    case "ANXIETY":
    case "DESPAIR":
    case "DOUBT":
        color = make_color_rgb(irandom_range(150,200), irandom_range(100,150), irandom_range(255,255));
        break;

    // 🟠 Guilt / Shame / Judgment — orange-gold
    case "GUILT":
    case "SHAME":
    case "JUDGMENT":
        color = make_color_rgb(255, irandom_range(160,210), irandom_range(60,110));
        break;

    // 🔵 Loss / Loneliness / Isolation — cool blue
    case "LOSS":
    case "LONELINESS":
    case "ISOLATION":
        color = make_color_rgb(irandom_range(100,160), irandom_range(120,170), irandom_range(255,255));
        break;

    // 🟢 Envy / Comparison / Neglect — sickly green
    case "ENVY":
    case "COMPARISON":
    case "NEGLECT":
        color = make_color_rgb(irandom_range(140,190), 255, irandom_range(90,140));
        break;

    // ⚫ Stress / Pressure / Burden / Failure — gray-red
    case "STRESS":
    case "PRESSURE":
    case "BURDEN":
    case "FAILURE":
        color = make_color_rgb(irandom_range(230,255), irandom_range(100,140), irandom_range(100,140));
        break;

    default:
        // fallback reddish-purple emotional tone
        color = make_color_rgb(
            irandom_range(200,255),
            irandom_range(60,140),
            irandom_range(120,180)
        );
        break;
}

// --- movement and behavior setup ---
vx = 0;
vy = 0;
x_speed = 0;
y_speed = 0;

chase_accel   = 0.2;
max_speed     = 0.8;
repel_strength = 0.4;

float_t = random(360);
target  = oHero;
