const dp: number[][][][] = Array.from({ length: 28 }, () =>
    Array.from({ length: 28 }, () =>
        Array.from({ length: 28 }, () => Array(2).fill(0))
    )
);

function earliestAndLatest(n: number, f: number, s: number): number[] {
    return helper(f - 1, s - f - 1, n - s);
}

function helper(x: number, y: number, z: number): number[] {
    if (x === z) return [1, 1];
    if (x > z) return helper(z, y, x); // Ensure z > x
    if (dp[x][y][z][0] > 0) return dp[x][y][z];

    let a = x, b = y, c = z;
    c--; // Remove due to First Player
    if (a + b < c) {
        c--; // Remove due to Second Player
    } else if (a + b > c) {
        b--;
    }

    dp[x][y][z][0] = 100;
    const n = Math.floor((a + b + c) / 2); // Players to remove in each round

    for (let i = 0; i <= a; i++) {
        for (let j = a - i; j <= c - i; j++) {
            const k = a + b + c - n - i - j;
            if (k >= 0 && k <= b) {
                const tmp = helper(i, k, j);
                dp[x][y][z][0] = Math.min(dp[x][y][z][0], tmp[0] + 1);
                dp[x][y][z][1] = Math.max(dp[x][y][z][1], tmp[1] + 1);
            }
        }
    }

    return dp[x][y][z];
}