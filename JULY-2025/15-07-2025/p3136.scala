object Solution {
    def isValid(word: String): Boolean = {
        if (word.length < 3 || word.contains('@') || word.contains('#') ||
        word.contains('$')) false
        else {
            val vowels = "aeiouAEIOU".toCharArray.toSet
            val consonants = ('a' to 'z').toSet ++ ('A' to 'Z').toSet -- vowels
            word.exists(c => vowels.contains(c)) &&
            word.exists(c => consonants.contains(c))
        }
    }
}