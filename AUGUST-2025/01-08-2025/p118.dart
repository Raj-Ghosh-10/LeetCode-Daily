class Solution {
  List<List<int>> generate(int numRows) {
    List<List<int>> ans = [
      [1]
    ];

    for (int i = 1; i < numRows; i++) {
      ans.add(List.filled(i + 1, 1));
      for (int j = 1; j < ans[i].length - 1; j++) {
        ans[i][j] = ans[i - 1][j - 1] + ans[i - 1][j];
      }
    }

    return ans;
  }
}