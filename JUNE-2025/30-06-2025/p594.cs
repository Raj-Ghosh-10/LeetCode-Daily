public class Solution {
    public int FindLHS(int[] nums)
    {
        var dict = new Dictionary<int, int>();

        foreach (var item in nums)
        {
            dict.TryGetValue(item, out int count);
            dict[item] = count + 1;
        }

        var res = 0;
        foreach(var item in dict)
            if(dict.ContainsKey(item.Key + 1))
                res = Math.Max(res, item.Value + dict[item.Key + 1]);
        
        return res; 
    }
}