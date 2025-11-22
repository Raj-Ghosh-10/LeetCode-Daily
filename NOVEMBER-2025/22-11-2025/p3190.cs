public class Solution {
    public int MinimumOperations(int[] nums) {
        int ans = 0;
        foreach (int x in nums) if (x % 3 != 0) ans++;
        return ans;
    }
}