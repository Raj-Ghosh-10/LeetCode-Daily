public class Solution {
    // { OR result : freq }
    SortedDictionary<int, int> descDict = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    public int CountMaxOrSubsets(int[] nums) {
        // generate all subsets
        // init prevCal = 0 because x | 0 = x
        dfs(0, nums, 0);
        return descDict.Values.First();
    }

    public int dfs(int index, int[] nums, int prevCal){
        // HERE IS THE CATCH
        // max OR will be the OR of all elements in subarr
        // so we will add the local result when it reach the end of the subarray
        if(index >= nums.Length){
            if(descDict.ContainsKey(prevCal)){
                descDict[prevCal] += 1;
            }else
            {
                descDict[prevCal] = 1;
            }
            return prevCal;
        }

        // decision 1, include nums[i]
        int newCal1 = dfs(index + 1, nums, prevCal | nums[index]);

        // decision 2, not to include nums[i];
        int newCal2 = dfs(index + 1, nums, prevCal);
        
        // finding max OR bitwise
        return Math.Max(newCal1, newCal2);
    }
}