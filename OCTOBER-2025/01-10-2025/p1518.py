class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        ne=numExchange
        nb=numBottles
        c=nb
        if nb<ne:
            return nb
        while nb>=ne:
            c+=nb//ne
            nb=nb//ne+nb%ne
        return c