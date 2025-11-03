function string_upper_letters_only(_s) {
    var out = "";
    _s = string_upper(_s);
    for (var i = 1; i <= string_length(_s); i++) {
        var ch = string_char_at(_s, i);
        if (ord(ch) >= ord("A") && ord(ch) <= ord("Z")) out += ch;
    }
    return out;
}
 