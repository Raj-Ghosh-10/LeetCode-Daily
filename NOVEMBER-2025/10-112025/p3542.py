#python

class Solution(object):
    def minOperations(self, nums):
        s = [0]
        res = 0
        for a in nums:
            while s and s[-1] > a:
                s.pop()
            if not s or s[-1] < a:
                res += 1
                s.append(a)
        return res


#python3


class Solution:
    def minOperations(self, nums):
        stack = [0] * (len(nums) + 1)
        top = 0
        ans = 0

        for num in nums:
            while stack[top] > num:
                top -= 1
                ans += 1
            if stack[top] != num:
                top += 1
                stack[top] = num

        return ans + top