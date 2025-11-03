/// @function is_opposite(a, b)
/// @param a
/// @param b

function is_opposite(a, b) {
    if ((a == "TRUTH" && b == "LIES") || (a == "LIES" && b == "TRUTH")) return true;
    if ((a == "COURAGE" && b == "FEAR") || (a == "FEAR" && b == "COURAGE")) return true;
    if ((a == "HOPE" && b == "DESPAIR") || (a == "DESPAIR" && b == "HOPE")) return true;
    return false;
}