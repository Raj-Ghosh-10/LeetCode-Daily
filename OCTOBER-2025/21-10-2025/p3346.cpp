class Solution {
public:
    int maxFrequency(vector<int>& nums, int k, int numOperations) {
        int maxNum = 0, r = 0;
        for (auto num : nums)
            maxNum = max(maxNum, num);

        vector<int> freq(maxNum + 1, 0), sums(maxNum + 1, 0);
        for (auto n : nums)
            freq[n]++;
        for (int i = 0; i <= maxNum; ++i)
            sums[i] = (i > 0 ? sums[i - 1] : 0) + freq[i];
        for (int i = 0; i <= maxNum; ++i)
            r = max(r, getFreq(freq, sums, i, k, numOperations));
        return r;
    }

    int getFreq(const vector<int>& freq, const vector<int>& sums, int num,
                int k, int numOperations) {
        int n = int(freq.size());
        int sLeft = (num - 1 >= 0 ? sums[num - 1] : 0) -
                    (num - k - 1 >= 0 ? sums[num - k - 1] : 0);
        int sRight = (num + k < n ? sums[num + k] : sums.back()) - sums[num];
        return min(sLeft + sRight, numOperations) + freq[num];
    }
};