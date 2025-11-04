#python

class Solution(object):
    def findXSum(self, nums, k, x):
        """
        :type nums: List[int]
        :type k: int
        :type x: int
        :rtype: List[int]
        """
        n = len(nums)
        res = []
        for i in range(0, n-k+1):
            newNums = nums[i: i+k]
            mapp = {}
            for num in newNums:
                mapp[num] = mapp.get(num, 0) + 1
            minHeap = []
            for val, freq in mapp.items():
                item = (freq, val)
                if len(minHeap) < x:
                    heapq.heappush(minHeap, item)
                else:
                    heapq.heappushpop(minHeap, item)
            summ = 0
            for freq, val in minHeap:
                summ += freq * val
            res.append(summ)
        return res

# python3

class Solution:
    def findXSum(self, nums: List[int], k: int, x: int) -> List[int]:
        k_ele_maps = {}
        answer = [0] * (len(nums) - k + 1)

        for i in range(k):
            if nums[i] not in k_ele_maps:
                k_ele_maps[nums[i]] = 1
            else:
                k_ele_maps[nums[i]] += 1

        for i in range(len(nums) - k + 1):
            top = sorted(k_ele_maps.items(), key=lambda kv: (kv[1], kv[0]), reverse=True)[:x]
            answer[i] = sum(v * f for v, f in top)
            out_num = nums[i]
            k_ele_maps[out_num] -= 1
            if k_ele_maps[out_num] == 0:
                del k_ele_maps[out_num]
            if i + k < len(nums):
                in_num = nums[i + k]
                if in_num not in k_ele_maps:
                    k_ele_maps[in_num] = 1
                else:
                    k_ele_maps[in_num] += 1

        return(answer)  