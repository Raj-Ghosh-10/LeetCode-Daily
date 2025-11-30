public class Solution {
    public int MinSubarray(int[] nums, int p) {
        long total = 0;
        foreach (var x in nums) total += x;
        int need = (int)(total % p);
        if (need == 0) return 0;

        var mp = new Dictionary<int, int>();
        mp[0] = -1;

        long prefix = 0;
        int res = nums.Length;

        for (int i = 0; i < nums.Length; i++) {
            prefix = (prefix + nums[i]) % p;
            int target = (int)((prefix - need + p) % p);
            if (mp.ContainsKey(target)) 
                res = Math.Min(res, i - mp[target]);
            mp[(int)prefix] = i;
        }

        return res == nums.Length ? -1 : res;
    }
}