public class Solution {
    public IList<bool> PrefixesDivBy5(int[] nums) {
        var ans = new List<bool>();
        int mod = 0;

        foreach (int bit in nums) {
            mod = (mod * 2 + bit) % 5;
            ans.Add(mod == 0);
        }

        return ans;
    }
}