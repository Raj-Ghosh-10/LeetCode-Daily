class Solution:
    def findLucky(self, arr: List[int]) -> int:
        freq = {}
        lucky = -1
        for num in arr:
            if num in freq:
                freq[num] += 1
            else:
                freq[num] = 1
        for i in freq:
            if freq[i] == i:
                lucky = max(lucky,i)
        return lucky