public class FindSumPairs {    
    int[] n2; // class level access to nums2 for add and count
    Dictionary<int, int> vals1; // aggregation for values to cut down bulk
    Dictionary<int, int> vals2;

    public FindSumPairs(int[] nums1, int[] nums2) {        
        n2 = nums2;
        vals1 = new Dictionary<int, int>();
        vals2 = new Dictionary<int, int>();

        foreach (int num in nums1)
        {
            if (!vals1.ContainsKey(num)) vals1.Add(num, 1); else vals1[num]++;
        }

        foreach (int num in n2)
        {
            if (!vals2.ContainsKey(num)) vals2.Add(num, 1); else vals2[num]++;
        }
    }
    
    public void Add(int index, int val) {
        int oldVal = n2[index]; // get the previous value
        n2[index] += val; // update the array copy with the new value

        // update dict:
        vals2[oldVal]--; // wipe the old value out of the dictionary        
        if (vals2[oldVal] == 0) vals2.Remove(oldVal); // cull dead entries
        if (!vals2.ContainsKey(n2[index])) vals2.Add(n2[index], 1); else vals2[n2[index]]++; // add or inc new val
    }
    
    public int Count(int tot) {
        int result = 0;
        // test aggregated nums1 vs nums2 to get the latest answer
        foreach (KeyValuePair<int, int> pair in vals1)
        {
            int target = tot - pair.Key;
            if (vals2.ContainsKey(target)) result += vals2[target] * pair.Value;
        }

        return result;
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * FindSumPairs obj = new FindSumPairs(nums1, nums2);
 * obj.Add(index,val);
 * int param_2 = obj.Count(tot);
 */