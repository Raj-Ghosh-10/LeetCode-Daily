class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        
        ROWS , COLS = len(mat) , len(mat[0])
        res = []
  
        def dfs(i , j ):
            res.append(mat[i][j])
            if i == ROWS -1 and j == COLS - 1:
                return
            # Going upwards cause its even number
            if (i + j) % 2 == 0:
                if i - 1 >= 0 and j +1 < COLS:
                    dfs(i-1,j+1)
                elif j + 1 < COLS:
                    dfs(i,j+1)
                else:
                    dfs(i+1,j)

            # Going downwards cause its odd number
            else:
                if i + 1 >= 0 and i + 1 < ROWS and j - 1 >= 0:
                    dfs(i+1 , j-1)
                elif i + 1 < ROWS:
                    dfs(i+1,j) 
                else:
                    dfs(i,j+1)

        dfs(0,0)
        return res
        
      