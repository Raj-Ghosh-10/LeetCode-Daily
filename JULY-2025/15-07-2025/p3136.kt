class Solution {
    fun isValid(word: String): Boolean {
        if (word.length < 3) return false

        var vowels = 0
        var consonants = 0

        for (char in word) {
            if (isNotDigit(char) && isNotLetter(char)) return false
            if (isLetter(char)) {
                if (isVowel(char)) vowels++
                else consonants++
            }
        }

        return if (vowels == 0 || consonants == 0) false else true
    }

    private fun isNotDigit(char: Char) = when {
        char in '0'..'9' -> false
        else -> true
    }

    private fun isLetter(char: Char) = when {
        char in 'a'..'z' || char in 'A'..'Z' -> true
        else -> false
    }

    private fun isNotLetter(char: Char) = when {
        char in 'a'..'z' || char in 'A'..'Z' -> false
        else -> true
    }

    private fun isVowel(char: Char) = when {
        char in "aeiou" || char in "AEIOU" -> true
        else -> false
    }
}