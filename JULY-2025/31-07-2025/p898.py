class Solution:
    def subarrayBitwiseORs(self, arr: List[int]) -> int:
        res = set()
        cur = set()

        for num in arr:
            cur = {elem | num for elem in cur} | {num}

            res |= cur
        
        return len(res)