class Solution(object):
    def processQueries(self, c, connections, queries):
        """
        :type c: int
        :type connections: List[List[int]]
        :type queries: List[List[int]]
        :rtype: List[int]
        """

        parent = range(c + 1)
        rank = [0] * (c + 1)

        def find(x):
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        def union(a, b):
            ra, rb = find(a), find(b)
            if ra == rb:
                return
            if rank[ra] < rank[rb]:
                parent[ra] = rb
            elif rank[ra] > rank[rb]:
                parent[rb] = ra
            else:
                parent[rb] = ra
                rank[ra] += 1

        for u, v in connections:
            union(u, v)

        comp_members = {}
        for i in range(1, c + 1):
            r = find(i)
            comp_members.setdefault(r, []).append(i)
        for r in comp_members:
            comp_members[r].sort()
        comp_ptr = {r: 0 for r in comp_members}

        online = [False] * (c + 1)
        for i in range(1, c + 1):
            online[i] = True

        def smallest_online_in_comp(root):
            if root not in comp_members:
                return -1
            members = comp_members[root]
            p = comp_ptr[root]
            n = len(members)
           
            while p < n and not online[members[p]]:
                p += 1
            comp_ptr[root] = p
            return members[p] if p < n else -1

        ans = []
        for typ, x in queries:
            if typ == 1:
                if online[x]:
                    ans.append(x)
                else:
                    ans.append(smallest_online_in_comp(find(x)))
            else:  
                if online[x]:
                    online[x] = False  

        return ans

#python3

from typing import List

class Solution:
    def processQueries(self, c: int, connections: List[List[int]], queries: List[List[int]]) -> List[int]:
        parent=list(range(c+1))
        def find(x):
            while parent[x]!=x:
                parent[x]=parent[parent[x]]
                x=parent[x]
            return x
        for a,b in connections:
            ra,rb=find(a),find(b)
            if ra!=rb:
                parent[rb]=ra
        next_node=[0]*(c+1)
        comp_min=[0]*(c+1)
        last={}
        for i in range(1,c+1):
            r=find(i)
            if comp_min[r]==0:
                comp_min[r]=i
            else:
                next_node[last[r]]=i
            last[r]=i
        offline=[False]*(c+1)
        res=[]
        for t,x in queries:
            if t==1:
                if not offline[x]:
                    res.append(x)
                else:
                    r=find(x)
                    m=comp_min[r]
                    res.append(m if m else -1)
            else:
                if offline[x]:
                    continue
                offline[x]=True
                r=find(x)
                if comp_min[r]==x:
                    y=next_node[x]
                    while y and offline[y]:
                        y=next_node[y]
                    comp_min[r]=y
        return res