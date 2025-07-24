function minimumScore(nums: number[], edges: number[][]): number {
    const n: number = nums.length;
    const graph: number[][] = Array.from({ length: n }, () => []);

    for (const [u, v] of edges) {
        graph[u].push(v);
        graph[v].push(u);
    }

    const xorSubTree: number[] = Array(n).fill(0);
    const inTime: number[] = Array(n).fill(0);
    const outTime: number[] = Array(n).fill(0);
    let time: number = 0;

    const DFS = (u: number, parent: number): number => {
        let xor = nums[u];
        inTime[u] = time++;
        for (const v of graph[u]) {
            if (v !== parent) {
                xor ^= DFS(v, u);
            }
        }
        outTime[u] = time;
        xorSubTree[u] = xor;
        return xor;
    };

    const isAncestor = (u: number, v: number): boolean => {
        return inTime[u] < inTime[v] && outTime[v] <= outTime[u];
    };

    const totalXor: number = DFS(0, -1);

    const subTreeRoots: number[] = [];
    for (const [u, v] of edges) {
        subTreeRoots.push(inTime[u] > inTime[v] ? u : v);
    }

    let minScore: number = Infinity;
    const m: number = subTreeRoots.length;

    for (let i = 0; i < m; i++) {
        for (let j = i + 1; j < m; j++) {
            const u: number = subTreeRoots[i];
            const v: number = subTreeRoots[j];
            let a: number, b: number, c: number;

            if (isAncestor(u, v)) {
                a = xorSubTree[v];
                b = xorSubTree[u] ^ xorSubTree[v];
                c = totalXor ^ xorSubTree[u];
            } else if (isAncestor(v, u)) {
                a = xorSubTree[u];
                b = xorSubTree[v] ^ xorSubTree[u];
                c = totalXor ^ xorSubTree[v];
            } else {
                a = xorSubTree[u];
                b = xorSubTree[v];
                c = totalXor ^ xorSubTree[u] ^ xorSubTree[v];
            }

            const score = Math.max(a, b, c) - Math.min(a, b, c);
            minScore = Math.min(minScore, score);
        }
    }

    return minScore;
};