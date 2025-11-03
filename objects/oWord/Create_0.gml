if (!variable_instance_exists(id, "word_text")) {
    word_text = choose("FEAR", "TRUTH", "LIES", "LOVE", "DESPAIR");
}

float_t = random(360);
hp = 1;
alpha = 0; // for fade-in