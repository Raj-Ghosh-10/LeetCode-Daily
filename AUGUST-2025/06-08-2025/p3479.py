from typing import List
from math import sqrt

class Solution:
    def numOfUnplacedFruits(self, fruits: List[int], baskets: List[int]) -> int:
        n = len(baskets)
        block_size = int(sqrt(n)) + 1

        blocks = [max(baskets[i:i + block_size]) for i in range(0, n, block_size)]

        unplaced = 0

        for fruit in fruits:
            placed = False
            for b in range(len(blocks)):
                if blocks[b] >= fruit:
                    start = b * block_size
                    end = min(start + block_size, n)
                    for i in range(start, end):
                        if baskets[i] >= fruit:
                            baskets[i] = 0  
                            
                            blocks[b] = max(baskets[start:end])
                            placed = True
                            break
                    if placed:
                        break
            if not placed:
                unplaced += 1

        return unplaced