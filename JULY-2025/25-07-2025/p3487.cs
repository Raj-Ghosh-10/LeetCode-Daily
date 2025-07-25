public class Solution {
    // Time O(n) | Space O(100)~O(1), n = length of 'nums'
    public int MaxSum(int[] nums) {
        bool[] used = new bool[101];
        int total = 0;
        foreach(var n in nums)
            if(n>0 && !used[n])
            {
                used[n] = true;
                total+=n;
            }
        return total>0 ? total : nums.Max();
    }
}