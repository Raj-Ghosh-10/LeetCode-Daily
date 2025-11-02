class Solution {
    public int countUnguarded(int m, int n, int[][] guards, int[][] walls) {
        int[][] arr = new int[m][n];
        for (int[] w : walls)
            arr[w[0]][w[1]] = -1;
        for (int[] g : guards)
            arr[g[0]][g[1]] = -1;
        for (int[] g : guards)
            populate(g[0], g[1], arr);
        int ans = 0;
        for (int[] row : arr)
            for (int cell : row)
                if (cell == 0)
                    ans++;
        return ans;
    }
    private void populate(int a, int b, int[][] arr) {
        for (int i = a - 1; i >= 0; i--) {
            if (arr[i][b] < 0) break;
            arr[i][b] = 1;
        }
        for (int i = a + 1; i < arr.length; i++) {
            if (arr[i][b] < 0) break;
            arr[i][b] = 1;
        }
        for (int j = b - 1; j >= 0; j--) {
            if (arr[a][j] < 0) break;
            arr[a][j] = 1;
        }
        for (int j = b + 1; j < arr[0].length; j++) {
            if (arr[a][j] < 0) break;
            arr[a][j] = 1;
        }
    }
}