class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        
        
        if numRows==1:
            return [[1]]

        if numRows==2:
            return [[1],[1,1]]

        res=[[1]]

        for i in range(numRows-1):
            curr=[]
            curr.append(1)
            for j in range(i):
                curr.append(sum(res[-1][j:j+2]))
            curr.append(1)
            res.append(curr)

        return res