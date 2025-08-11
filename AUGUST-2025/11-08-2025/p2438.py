class Solution:
    def productQueries(self, n: int, queries: List[List[int]]) -> List[int]:
        bin_n=bin(n)[2:]
        powers=[]
        exp=0
        for i in bin_n[::-1]:
            if i=="1":
                powers.append(2**exp)
            exp+=1
        ans=[]
        for query in queries:
            left,right=query
            product=1
            for i in range(left,right+1):
                product*=powers[i]
            ans.append(product%(10**9+7))
        return ans