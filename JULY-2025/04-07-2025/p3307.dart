class Solution {
  String kthCharacter(int k, List<int> operations) {
    k -= 1; // Convert 1-based to 0-based
    int c = 0;

    for (int i = operations.length - 1; i >= 0; i--) {
      if ((k >> i & 1) == 1) {
        c += operations[i];
      }
    }

    int charCode = 'a'.codeUnitAt(0) + (c % 26);
    return String.fromCharCode(charCode);
  }
}