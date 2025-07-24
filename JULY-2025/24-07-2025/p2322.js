/**
 * @param {number[]} nums
 * @param {number[][]} edges
 * @return {number}
 */


var minimumScore = function(nums, edges) {
    const n = nums.length;
    const tree = Array.from({ length: n }, () => []);

    for (const [u, v] of edges) {
        tree[u].push(v);
        tree[v].push(u);
    }

    const xor = new Array(n).fill(0);
    const parent = new Array(n).fill(-1);
    const inTime = new Array(n).fill(0);
    const outTime = new Array(n).fill(0);
    let clock = 1;

    // DFS to compute subtree XOR + entry/exit times
    const dfs = (node, par) => {
        xor[node] = nums[node];
        parent[node] = par;
        inTime[node] = clock++;
        for (const nei of tree[node]) {
            if (nei !== par) {
                dfs(nei, node);
                xor[node] ^= xor[nei];
            }
        }
        outTime[node] = clock++;
    };

    dfs(0, -1);
    const total = xor[0];
    let res = Infinity;

    const isAncestor = (u, v) =>
        inTime[u] <= inTime[v] && outTime[v] <= outTime[u];

    for (let i = 1; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (parent[i] === -1 || parent[j] === -1) continue;

            let xor1, xor2, xor3;

            if (isAncestor(i, j)) {
                xor2 = xor[j];
                xor1 = xor[i] ^ xor[j];
                xor3 = total ^ xor[i];
            } else if (isAncestor(j, i)) {
                xor1 = xor[i];
                xor2 = xor[j] ^ xor[i];
                xor3 = total ^ xor[j];
            } else {
                xor1 = xor[i];
                xor2 = xor[j];
                xor3 = total ^ xor[i] ^ xor[j];
            }

            const vals = [xor1, xor2, xor3];
            res = Math.min(res, Math.max(...vals) - Math.min(...vals));
        }
    }

    return res;
};