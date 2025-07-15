class Solution {
  bool isValid(String word) {
     word = word.toUpperCase();

    if (word.trim().length < 3) {
      return false;
    }

    bool isValidWord = false;
    for (var i = 0; i < word.length; i++) {
      final code = word.codeUnitAt(i);

      if (code >= 48 && code <= 57) {
        continue;
      }

      if (code >= 65 && code <= 90) {
        continue;
      }

      return false;
    }

    final vowels = ['A', 'E', 'I', 'O', 'U'];
    bool hasVowel = false;
    for (var i = 0; i < word.length; i++) {
      hasVowel = vowels.contains(word[i]);
      if (hasVowel) {
        break;
      }
    }

    bool hasConsonant = false;
    final consonants = [
      'B',
      'C',
      'D',
      'F',
      'G',
      'H',
      'J',
      'K',
      'L',
      'M',
      'N',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    for (var i = 0; i < word.length; i++) {
      hasConsonant = consonants.contains(word[i]);
      if (hasConsonant) {
        break;
      }
    }

    return hasVowel && hasConsonant;
  }
}