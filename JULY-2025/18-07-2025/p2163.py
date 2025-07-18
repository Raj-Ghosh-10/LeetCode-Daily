class Solution:
    def minimumDifference(self, nums: List[int]) -> int:
        n: int = len(nums) // 3
        prefix: list[int] = [float('inf')] * (n * 3)
        suffix: list[int] = [0] * (n * 3)
        cur_sum: int = 0
        min_heap: list[int] = []
        for i in range(n * 2):
            if len(min_heap) < n or -min_heap[0] > nums[i]:
                if len(min_heap) == n: cur_sum -= -heapq.heappop(min_heap)
                cur_sum += nums[i]
                heapq.heappush(min_heap, -nums[i])
            prefix[i] = cur_sum
        min_heap = []
        cur_sum = 0
        for i in range(n * 3 - 1, n - 1, -1):
            if len(min_heap) < n or min_heap[0] < nums[i]:
                if len(min_heap) == n: cur_sum -= heapq.heappop(min_heap)
                cur_sum += nums[i]
                heapq.heappush(min_heap, nums[i])
            suffix[i] = cur_sum
        output: int = float('inf')
        for i in range(n - 1, 2 * n + 1):
            if i - 1 > n - 1: output = min(output, prefix[i - 1] - suffix[i])
            if i + 1 < 2 * n: output = min(output, prefix[i] - suffix[i + 1])
        return output