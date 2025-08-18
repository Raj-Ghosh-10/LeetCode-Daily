class Solution:
    def judgePoint24(self, cards: List[int]) -> bool:
        nums = [float(x) for x in cards]
        return self.solve(nums)

    def solve(self, nums: List[float]) -> bool:
        n = len(nums)
        if n == 1:
            return abs(nums[0] - 24.0) < 1e-6

        for i in range(n):
            for j in range(i + 1, n):
                next_nums = [nums[k] for k in range(n) if k != i and k != j]

                for val in self.compute(nums[i], nums[j]):
                    next_nums.append(val)
                    if self.solve(next_nums):
                        return True
                    next_nums.pop()
        return False

    def compute(self, a: float, b: float) -> List[float]:
        res = [a + b, a - b, b - a, a * b]
        if abs(b) > 1e-6:
            res.append(a / b)
        if abs(a) > 1e-6:
            res.append(b / a)
        return res