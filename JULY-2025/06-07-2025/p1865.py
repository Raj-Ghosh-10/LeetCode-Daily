class FindSumPairs:

    def __init__(self, nums1: List[int], nums2: List[int]):
        self.h1 = Counter(nums1)
        self.h2 = Counter(nums2)
        self.nums2 = nums2

    def add(self, index: int, val: int) -> None:
        num2 = self.nums2[index]
        self.nums2[index] += val
        if self.h2[num2] > 0:
            self.h2[num2] -= 1
        
        self.h2[num2+val] += 1

    def count(self, tot: int) -> int:
        res = 0
        for key1, val1 in self.h1.items():
            if key1 > tot:
                continue
            if tot-key1 in self.h2:
                res += val1 * self.h2[tot-key1] 

        return res


# Your FindSumPairs object will be instantiated and called as such:
# obj = FindSumPairs(nums1, nums2)
# obj.add(index,val)
# param_2 = obj.count(tot)