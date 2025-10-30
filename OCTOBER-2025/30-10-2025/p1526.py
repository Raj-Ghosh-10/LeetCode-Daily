#python

class Solution(object):
    def minNumberOperations(self, target):
        last =0
        ops =0
        for i in target :
            if i > last:
                ops += i-last
            last = i
        return ops


#python3

class Solution:
    def minNumberOperations(self, target: List[int]) -> int:
        ans = power = prev = 0
        for i in target:
            if i >= prev:
                power = i - prev
                ans += power
            prev = i

        return ans