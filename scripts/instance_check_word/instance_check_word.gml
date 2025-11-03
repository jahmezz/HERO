/// @function instance_check_word(_typed)
/// @param _typed

function instance_check_word(_typed) {
    if (string_upper(_typed) == word) {
        instance_destroy();
    } else if (is_opposite(_typed, word)) {
        instance_destroy();
    }
}