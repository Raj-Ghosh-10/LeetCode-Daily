class Solution {
  int findLucky(List<int> arr) {
    List<int> freq = [];

    int lucky = -1;
    for (int i = 0; i < arr.length; i++) {
      int current = arr[i];
      if (freq.contains(current)) {
        continue;
      }
      int count = 1;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[j] == current) {
          count++;
        }
      }
      if (count == current) {
        print('$current is a lucky integer');
        if (current > lucky) lucky = current;
      } else {
        print('$current is not a lucky integer');
      }
      freq.add(current);
    }
     return lucky;
  }
}