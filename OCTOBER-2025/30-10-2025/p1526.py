class Solution(object):
    def minNumberOperations(self, target):
        last =0
        ops =0
        for i in target :
            if i > last:
                ops += i-last
            last = i
        return ops