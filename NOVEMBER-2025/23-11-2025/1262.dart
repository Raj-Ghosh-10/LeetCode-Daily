class Solution {
  int maxSumDivThree(List<int> nums) {
    int sum = 0;

    int m1a = 1 << 62, m1b = 1 << 62;
    int m2a = 1 << 62, m2b = 1 << 62;

    for (int x in nums) {
      sum += x;
      int r = x % 3;

      if (r == 1) {
        if (x < m1a) {
          m1b = m1a;
          m1a = x;
        } else if (x < m1b) {
          m1b = x;
        }
      } else if (r == 2) {
        if (x < m2a) {
          m2b = m2a;
          m2a = x;
        } else if (x < m2b) {
          m2b = x;
        }
      }
    }

    int rem = sum % 3;
    if (rem == 0) return sum;

    int big = 1 << 62;
    int remove = big;

    if (rem == 1) {
      int opt1 = m1a;
      int opt2 = m2b < big ? m2a + m2b : big;
      remove = opt1 < opt2 ? opt1 : opt2;
    } else {
      int opt1 = m2a;
      int opt2 = m1b < big ? m1a + m1b : big;
      remove = opt1 < opt2 ? opt1 : opt2;
    }

    return remove == big ? 0 : sum - remove;
  }
}