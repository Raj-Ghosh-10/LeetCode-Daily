class Solution:
    def maxBottlesDrunk(self, numBottles: int, numExchange: int) -> int:
        ans = numBottles
        empty = numBottles

        while empty >= numExchange:
            empty -= numExchange   # use empty bottles for exchange
            ans += 1               # drink new bottle
            empty += 1             # new empty bottle after drinking
            numExchange += 1       # requirement increases
        
        return ans