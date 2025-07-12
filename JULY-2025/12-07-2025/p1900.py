class Solution:
    def earliestAndLatest(self, n: int, firstPlayer: int, secondPlayer: int) -> List[int]:
        dic_min = {}
        dic_max = {}

        # recursive function for miminum rounds
        def calc_min(n, idx1, idx2):
            # print('!', n, idx1, idx2)
            if idx2 < idx1:  
                return calc_min(n, idx2, idx1)
            if idx1 > n // 2 or (n % 2 == 1 and idx1 == n // 2 + 1): 
                return calc_min(n, n + 1 - idx2, n + 1 - idx1)
            if (n, idx1, idx2) in dic_min: 
                return dic_min[n, idx1, idx2]
            if idx1 + idx2 == n + 1: 
                return 1
            else: 
                res = float('inf')
                if idx2 <= n // 2 or (n % 2 == 1 and idx2 == n // 2 + 1): 
                    for i in range(1, idx1 + 1): 
                        for j in range(i + 1, i + (idx2 - idx1) + 1): 
                            res = min(res, calc_min((n + 1) // 2, i, j))
                    dic_min[n, idx1, idx2] = res + 1
                    return res + 1
                elif idx2 > n // 2: 
                    if  n + 1 - idx2 < idx1: 
                        for r in range(0, n + 1 - idx2): 
                            for l in range(n + 1 - idx2 - r, idx1 - r): 
                                res = min(res, calc_min((n + 1) // 2, l, (n + 1) // 2 - r))
                        dic_min[n, idx1, idx2] = res + 1
                        return res + 1
                    else: 
                        for l in range(0, idx1): 
                            for r in range(idx1 - 1 - l, n - idx2 - l): 
                                res = min(res, calc_min((n + 1) // 2, l + 1, (n + 1) // 2 - r))
                        dic_min[n, idx1, idx2] = res + 1
                        return res + 1
        
        # recursive function for maximum rounds
        def calc_max(n, idx1, idx2): 
            # print('?', n, idx1, idx2)
            if idx2 < idx1:  
                return calc_max(n, idx2, idx1)
            if idx1 > n // 2 or (n % 2 == 1 and idx1 == n // 2 + 1): 
                return calc_max(n, n + 1 - idx2, n + 1 - idx1)
            if (n, idx1, idx2) in dic_max: 
                return dic_max[n, idx1, idx2]
            if idx1 + idx2 == n + 1: 
                return 1
            else: 
                res = -float('inf')
                if idx2 <= n // 2 or (n % 2 == 1 and idx2 == n // 2 + 1): 
                    for i in range(1, idx1 + 1): 
                        for j in range(i + 1, i + (idx2 - idx1) + 1): 
                            res = max(res, calc_max((n + 1) // 2, i, j))
                    dic_max[n, idx1, idx2] = res + 1
                    return res + 1
                elif idx2 > n // 2: 
                    if  n + 1 - idx2 < idx1: 
                        for r in range(0, n + 1 - idx2): 
                            for l in range(n + 1 - idx2 - r, idx1 - r): 
                                res = max(res, calc_max((n + 1) // 2, l, (n + 1) // 2 - r))
                        dic_max[n, idx1, idx2] = res + 1
                        return res + 1
                    else: 
                        for l in range(0, idx1): 
                            for r in range(idx1 - 1 - l, n - idx2 - l): 
                                res = max(res, calc_max((n + 1) // 2, l + 1, (n + 1) // 2 - r))
                        dic_max[n, idx1, idx2] = res + 1
                        return res + 1
                            
        return [calc_min(n, firstPlayer, secondPlayer), calc_max(n, firstPlayer, secondPlayer)]



        