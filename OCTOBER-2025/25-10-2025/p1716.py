class Solution:
    def totalMoney(self, n: int) -> int:
        def calculateRemainingDaysMoney(num, week, res):
            while num > 0:
                res += week
                week += 1
                num -= 1
            return res
        if n < 7:
            return calculateRemainingDaysMoney(n, 1, 0)
        fix = 28
        weeks = n // 7
        remaining = n % 7
        res = 0        
        while weeks > 0:
            res += fix
            fix += 7
            weeks -= 1
        if remaining > 0:
            k = n // 7
            return calculateRemainingDaysMoney(remaining, k+1, res)
        return res