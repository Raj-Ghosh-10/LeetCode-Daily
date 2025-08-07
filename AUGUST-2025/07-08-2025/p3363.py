class Solution:

    def dp(self, steps, pos, dirs, is_upper, memo, fruits, n):
        if steps == n-1 : 
            return 0 if pos == (n-1, n-1) else float('-inf')

        state = (steps, pos)
        if state in memo : 
            return memo[state]
        fruits_collected = fruits[pos[0]][pos[1]]

        neighbour_fruits = 0
        for dx, dy in dirs : 
                nx, ny = pos[0] + dx, pos[1] + dy
                if nx < 0 or nx >= n or ny < 0 or ny >= n : continue
                if (is_upper and nx >= ny)  or (not is_upper and nx <= ny) : continue
                neighbour_fruits = max(neighbour_fruits, self.dp(steps+1, (nx, ny), dirs, is_upper, memo, fruits, n))

        res = fruits_collected + neighbour_fruits     
        memo[state] = res
        return res  

    def maxCollectedFruits(self, fruits: List[List[int]]) -> int:
        
        n = len(fruits)
        c1_fruits = sum([fruits[i][i] for i in range(n)])

        c2_dirs = [(1, -1), (1, 0), (1, 1)]
        c2_fruits = self.dp(0, (0, n-1), c2_dirs, True, defaultdict(), fruits, n)

        c3_dirs = [(-1, 1), (0, 1), (1, 1)]
        c3_fruits = self.dp(0, (n-1, 0), c3_dirs, False, defaultdict(), fruits, n)

        return c1_fruits + c2_fruits + c3_fruits