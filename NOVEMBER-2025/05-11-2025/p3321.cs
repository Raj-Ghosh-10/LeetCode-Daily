public class Solution {
    private long currSum;
    private int x, n;
    private Dictionary<int,int> freq;

    public long[] FindXSum(int[] nums, int k, int _x) {
        this.x = _x;
        n = nums.Length;
        currSum = 0;
        freq = new Dictionary<int,int>();

        if (k > n) return Array.Empty<long>();
        long[] ans = new long[n - k + 1];

        var comparer = new PairDescComparer();

        var top = new SortedSet<(int freq, int val)>(comparer);
        var rest = new SortedSet<(int freq, int val)>(comparer); 
        for (int i = 0; i < k; i++) Update(nums[i], 1);
        Rebalance();
        ans[0] = currSum;
        for (int i = k; i < n; i++) {
            Update(nums[i - k], -1);
            Update(nums[i], 1);
            Rebalance();
            ans[i - k + 1] = currSum;
        }

        return ans;
        
        void Update(int num, int delta) {
            int old = freq.ContainsKey(num) ? freq[num] : 0;
            int now = old + delta;

            if (old > 0) {
                var oldT = (old, num);
                if (top.Remove(oldT))
                    currSum -= (long) old * num;
                else rest.Remove(oldT);
            }

            if (now <= 0) {
                if (freq.ContainsKey(num)) freq.Remove(num);
            } else {
                freq[num] = now;
                
                rest.Add((now, num));
            }
        }
        void Rebalance() {
            while (top.Count < x && rest.Count > 0) {
                var best = rest.Min; 
                rest.Remove(best);
                if (!freq.TryGetValue(best.val, out var f) || f != best.freq) continue;
                top.Add(best);
                currSum += (long)best.freq * best.val;
            }

            while (top.Count > 0 && rest.Count > 0) {
                var worstTop = top.Max;  
                var bestRest = rest.Min; 

                
                if (!freq.TryGetValue(worstTop.val, out var wtFreq) || wtFreq != worstTop.freq) {
                  
                    top.Remove(worstTop);
                    currSum -= (long)worstTop.freq * worstTop.val;
                    continue;
                }
                if (!freq.TryGetValue(bestRest.val, out var brFreq) || brFreq != bestRest.freq) {
                
                    rest.Remove(bestRest);
                    continue;
                }

                if (comparer.Compare(bestRest, worstTop) < 0) {
                   
                    top.Remove(worstTop);
                    currSum -= (long)worstTop.freq * worstTop.val;

                    rest.Remove(bestRest);

                    top.Add(bestRest);
                    currSum += (long)bestRest.freq * bestRest.val;

                    rest.Add(worstTop);
                } else break;
            }

        }
    }

    private class PairDescComparer : IComparer<(int freq, int val)> {
        public int Compare((int freq, int val) x, (int freq, int val) y) {
            if (x.freq != y.freq) return y.freq.CompareTo(x.freq); 
            if (x.val != y.val) return y.val.CompareTo(x.val);     
            return 0; 
        }
    }
}