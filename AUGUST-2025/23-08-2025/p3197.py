class Solution:
    def ma(self, grid: List[List[int]], si, ei, sj, ej) -> int:
        az = True
        for i in range(si, ei + 1):
            for j in range(sj, ej + 1):
                if grid[i][j] == 1:
                    az = False
                    break
            if not az:
                break
        else:
            return 0
        i = si
        while i <= ei:
            az = True
            for j in range(sj, ej + 1):
                if grid[i][j] == 1:
                    az = False
                    break
            
            if not az:
                break
            
            i += 1
        
        st = i

        i = 0
        while i <= ei - si:
            li = ei - i
            az = True
            for j in range(sj, ej + 1):
                if grid[li][j] == 1:
                    az = False
                    break
            
            if not az:
                break
            
            i += 1
        
        ed = ei - i

        height = ed - st + 1
        

        j = sj
        while j <= ej:
            az = True
            for i in range(si, ei + 1):
                if grid[i][j] == 1:
                    az = False
                    break
            
            if not az:
                break
            
            j += 1
        
        st = j

        j = 0
        while j <= ej - sj:
            lj = ej - j
            az = True
            for i in range(si, ei + 1):
                if grid[i][lj] == 1:
                    az = False
                    break
            
            if not az:
                break
            
            j += 1
        
        ed = ej - j

        width = ed - st + 1
        return height * width

    def minimumSum(self, grid: List[List[int]]) -> int:
        n = len(grid)
        m = len(grid[0])
        ans = n * m
        for hz_split1 in range(0, n-2):
            for hz_split2 in range(hz_split1 + 1, n-1):
                """
                **********************
                *      part1         *
                *                    *
                *--------------------*
                *         part2      *
                *                    *
                *--------------------*
                *           part3    *
                *                    *
                **********************
                """
                a1 = max(self.ma(grid, 0, hz_split1, 0, m-1), 1)
                a2 = max(self.ma(grid, hz_split1 + 1, hz_split2, 0, m-1), 1)
                a3 = max(self.ma(grid, hz_split2 + 1, n-1, 0, m-1), 1)

                ans = min(ans, a1 + a2 + a3)
        
        for ve_split1 in range(0, m-2):
            for ve_split2 in range(ve_split1 + 1, m - 1):
                """
                *****************************************
                *            |            |             *
                *            |            |             *
                *            |            |             *
                *   part1    |    part2   |    part3    *
                *            |            |             *
                *            |            |             *
                *            |            |             *
                *****************************************
                """
                a1 = max(self.ma(grid, 0, n-1, 0, ve_split1), 1)
                a2 = max(self.ma(grid, 0, n-1, ve_split1 + 1, ve_split2), 1)
                a3 = max(self.ma(grid, 0, n-1, ve_split2 + 1, m-1), 1)

                ans = min(ans, a1 + a2 + a3)
        
        for hz_split1 in range(0, n-1):
            for ve_split2 in range(0, m-1):
                """
                **********************
                *      part1         *
                *                    *
                *--------------------*
                *        |           *
                *        |           *
                * part2  |   part3   *
                *        |           *
                *        |           *
                **********************
                """
                a1 = max(self.ma(grid, 0, hz_split1, 0, m-1), 1)
                a2 = max(self.ma(grid, hz_split1 + 1, n-1, 0, ve_split2), 1)
                a3 = max(self.ma(grid, hz_split1 + 1, n-1, ve_split2 + 1, m-1), 1)

                """
                **********************
                *        |           *
                *        |           *
                * part2  |   part3   *
                *        |           *
                *        |           *
                *--------------------*
                *      part1         *
                *                    *
                **********************
                """

                ans = min(ans, a1 + a2 + a3)

                a1 = max(self.ma(grid, hz_split1 + 1, n-1, 0, m-1), 1)
                a2 = max(self.ma(grid, 0, hz_split1, 0, ve_split2), 1)
                a3 = max(self.ma(grid, 0, hz_split1, ve_split2 + 1, m-1), 1)

                ans = min(ans, a1 + a2 + a3)
        

        for ve_split1 in range(0, m-1):
            for hz_split2 in range(0, n-1):
                """
                **********************************
                *            |                   *
                *            |       part2       *
                *            |                   *
                *   part1    |-------------------*
                *            |                   *
                *            |       part3       *
                *            |                   *
                **********************************
                """
                a1 = max(self.ma(grid, 0, n-1, 0, ve_split1), 1)
                a2 = max(self.ma(grid, 0, hz_split2, ve_split1 + 1, m-1), 1)
                a3 = max(self.ma(grid, hz_split2 + 1, n-1, ve_split1 + 1, m-1), 1)

                """
                **********************************
                *                   |            *
                *       part2       |            *
                *                   |            *
                *-------------------|   part1    *
                *                   |            *
                *       part3       |            *
                *                   |            *
                **********************************
                """
                ans = min(ans, a1 + a2 + a3)

                a1 = max(self.ma(grid, 0, n-1, ve_split1 + 1, m-1), 1)
                a2 = max(self.ma(grid, 0, hz_split2, 0, ve_split1), 1)
                a3 = max(self.ma(grid, hz_split2 + 1, n-1, 0, ve_split1), 1)

                ans = min(ans, a1 + a2 + a3)

        return ans