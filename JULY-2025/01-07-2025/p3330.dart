class Solution {
  int possibleStringCount(String word) {
    if (word.isEmpty) return 0;
    int count = 1;
    int currentLength = 1;
    for (int i = 1; i < word.length; i++) {
        if (word[i] == word[i - 1]) {
            currentLength++;
        } else {
            count += currentLength - 1;
            currentLength = 1;
        }
    }
    count += currentLength - 1;
    return count;
  }
}