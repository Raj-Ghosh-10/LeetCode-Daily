# @param {String} word
# @return {Boolean}
def is_valid(word)
    # Word doesnt meet 3 char requirement
    # if under 3 chars.
    if word.size < 3
        return false
    end

    # Create validators from hashes to see
    # if we have legal letters.
    char_validator = {}
    ("a".."z").each do |char|
        char_validator[char] = true
        char_validator[char.upcase] = true
    end

    ("0".."9").each do |char|
        char_validator[char] = true
    end

    # Use vowel validator to help with counting
    # vowels.
    vowel_validator = {}
    ['a', 'e', 'i', 'o', 'u'].each do |vowel|
        vowel_validator[vowel] = true
    end

    # Use num validator to help with counting
    # num.
    num_validator = {}
    ("0".."9").each do |char|
        num_validator[char] = true
    end

    vowel_count = 0
    consonant_count = 0
    num_count = 0
    word.each_char do |char|
        if !char_validator[char.downcase]
            return false
        else
            if vowel_validator[char.downcase]
                vowel_count += 1
            elsif num_validator[char]
                num_count += 1
            end
        end
    end

    # Find constant count.
    consonant_count = word.size - vowel_count - num_count

    # Check final requirements.
    if consonant_count > 0 and vowel_count > 0
        return true
    else
        return false
    end
    
end