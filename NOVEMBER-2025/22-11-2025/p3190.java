class Solution {
    public int minimumOperations(int[] nums) {
        int ans = 0;
        for (int x : nums) if (x % 3 != 0) ans++;
        return ans;
    }
}