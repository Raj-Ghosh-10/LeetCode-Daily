class Solution {
public:
    long long minimumDifference(vector<int>& nums) {
        int n = nums.size() / 3;
        std::vector<long long> prefix(n * 3, INT64_MAX), suffix(n * 3, 0);
        std::priority_queue<int, std::vector<int>, std::greater<int>> minHeap;
        long long curSum = 0;
        for (int i = 0; i < 2 * n; ++i) {
            if (minHeap.size() < n || -minHeap.top() > nums[i]) {
                if (minHeap.size() == n) {
                    curSum -= -minHeap.top();
                    minHeap.pop();
                }
                curSum += nums[i];
                minHeap.push(-nums[i]);
            }
            prefix[i] = curSum;
        }
        while (!minHeap.empty()) minHeap.pop();
        curSum = 0;
        for (int i = 3 * n - 1; i >= n; --i) {
            if (minHeap.size() < n || minHeap.top() < nums[i]) {
                if (minHeap.size() == n) {
                    curSum -= minHeap.top();
                    minHeap.pop();
                }
                curSum += nums[i];
                minHeap.push(nums[i]);
            }
            suffix[i] = curSum;
        }
        long long output = INT64_MAX;
        for (int i = n - 1; i <= n * 2; ++i) {
            if (i - 1 > n - 1) output = std::min(output, prefix[i - 1] - suffix[i]);
            if (i + 1 < n * 2) output = std::min(output, prefix[i] - suffix[i + 1]);
        }
        return output;
    }
};