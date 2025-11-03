function can_spell(word) {
    var temp_ammo = global.ammo;
    for (var i = 1; i <= string_length(word); i++) {
        var ch = string_char_at(word, i);
        var pos = string_pos(ch, temp_ammo);
        if (pos == 0) return false;
        temp_ammo = string_delete(temp_ammo, pos, 1);
    }
    return true;
}