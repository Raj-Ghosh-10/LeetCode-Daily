class Solution {
    private typealias Edge = (from: Int,to:Int)
    func minimumScore(_ nums: [Int], _ edges: [[Int]]) -> Int {

        let N = nums.count
        var tree = [[Int]](repeating: [], count: N)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }


        let root = 0
        var xorSum = [Int](repeating: 0, count:N )
        var subTrees = [Set<Int>](repeating: [], count: N)
        var level = [Int](repeating: -1, count: N)
        func dfs(_ parent: Int,_ node: Int, _ curLel:Int) {

            xorSum[node] = nums[node]
            subTrees[node].insert(node)
            level[node] = curLel
            for next in tree[node] {
                guard next != parent else {
                    continue
                }
                dfs(node, next, curLel + 1)
                xorSum[node] ^= xorSum[next]
                subTrees[node] = subTrees[node].union(subTrees[next])
            }
        }
        dfs(-1, root,0)

        let sortedDirectedEdges:[Edge] = edges.map({ e in
            if level[e[0]] < level[e[1]] {
                return (e[0],e[1])
            } else {
                return (e[1],e[0])
            }
        }).sorted { e1, e2 in
            level[e1.from] < level[e2.from]
        }
        var ans = Int.max
        let M = edges.count
        for i in 0..<M {
            var j = i + 1
            while j < M {

                let fe = sortedDirectedEdges[i]
                let se = sortedDirectedEdges[j]
                let nodes = [fe.from,fe.to,se.from,se.to]
                var (f,s,t) = (0,0,0)
                if subTrees[nodes[1]].contains(nodes[2]) {
                    (f,s,t) = (xorSum[root] ^ xorSum[nodes[1]],xorSum[nodes[1]] ^ xorSum[nodes[3]],xorSum[nodes[3]])

                } else {
                    (f,s,t) = (xorSum[root] ^ xorSum[nodes[1]] ^ xorSum[nodes[3]],xorSum[nodes[1]],xorSum[nodes[3]])
                }
                ans = min(ans, max(f,s,t) - min(f,s,t))
                j += 1
            }
        }
        return ans
    }
}