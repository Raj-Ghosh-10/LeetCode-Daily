class Solution:
    def areaOfMaxDiagonal(self, D: List[List[int]]) -> int:
        return max((a*a + b*b, a*b) for a,b in D)[1]