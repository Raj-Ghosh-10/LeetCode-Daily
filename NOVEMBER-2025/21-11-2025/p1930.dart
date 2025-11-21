class Solution {
  int countPalindromicSubsequence(String s) {
    int n = s.length;
    List<int> first = List.filled(26, -1);
    List<int> last = List.filled(26, -1);

    for (int i = 0; i < n; i++) {
      int c = s.codeUnitAt(i) - 97;
      if (first[c] == -1) first[c] = i;
      last[c] = i;
    }

    int ans = 0;

    for (int c = 0; c < 26; c++) {
      if (first[c] != -1 && last[c] - first[c] > 1) {
        int mask = 0;
        for (int i = first[c] + 1; i < last[c]; i++) {
          mask |= 1 << (s.codeUnitAt(i) - 97);
        }

        int count = 0;
        int x = mask;
        while (x > 0) {
          x &= (x - 1);
          count++;
        }
        ans += count;
      }
    }

    return ans;
  }
}