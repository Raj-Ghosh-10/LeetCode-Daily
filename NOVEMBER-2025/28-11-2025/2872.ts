function maxKDivisibleComponents(n: number, edges: number[][], values: number[], k: number): number {
    const g: number[][] = Array.from({ length: n }, () => []);

    for (const [a, b] of edges) {
        g[a].push(b);
        g[b].push(a);
    }

    let ans = 0;

    const dfs = (u: number, p: number): number => {
        let sum = values[u];
        for (const v of g[u]) {
            if (v === p) continue;
            sum += dfs(v, u);
        }
        if (sum % k === 0) {
            ans++;
            return 0;
        }
        return sum;
    };

    dfs(0, -1);
    return ans;
}