public class Solution {
    public int LongestSubsequence(string s, int k) {
        // Slide window:
        int len = s.Length, pre = 0, start = 0, maxLen = 0;
        List<int> ones = new();

        for(int i = 0; i < len; i++)
        {
            pre *= 2;
            int bit = s[i]-'0';
            pre += bit;
            while(pre > k)
            {
                int oneId = ones[start++];
                pre ^= (1<<(i-oneId));
            }

            int curCnt = (i+1-start);
            maxLen = Math.Max(maxLen, curCnt);
            if(bit == 1)
                ones.Add(i);
        }

        return maxLen;
    }
}