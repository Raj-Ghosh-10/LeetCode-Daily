class Solution:
    def maxTotalFruits(self, fruits: list[list[int]], startPos: int, k: int) -> int:

        def steps(lpos: int, rpos: int) -> int:
            if rpos <= startPos:
                return startPos - lpos
            elif lpos >= startPos:
                return rpos - startPos
            else:
                return min(startPos + rpos - 2 * lpos,
                           2 * rpos - startPos - lpos)

        cur_sum = 0
        ans = 0
        l = 0
        n = len(fruits)

        for r in range(n):
            cur_sum += fruits[r][1]

            while l <= r and steps(fruits[l][0], fruits[r][0]) > k:
                cur_sum -= fruits[l][1]
                l += 1

            ans = max(ans, cur_sum)

        return ans