class Solution {
    public int trapRainWater(int[][] heightMap) {
        var m = heightMap.length;
        var n = heightMap[0].length;
        var volume = new int[m][n];
        for (var i = 0; i < m; i++)
            System.arraycopy(heightMap[i], 0, volume[i], 0, n);

        var upt = true;
        var init = true;
        while (upt) {
            upt = false;
            for (var i = 1; i < m - 1; i++)
                for (var j = 1; j < n - 1; j++) {
                    var val = Math.max(heightMap[i][j], Math.min(volume[i - 1][j], volume[i][j - 1]));
                    if (init || volume[i][j] > val) {
                        volume[i][j] = val;
                        upt = true;
                    }
                }

            init = false;
            for (var i = m - 2; i >= 1; i--)
                for (var j = n - 2; j >= 1; j--) {
                    var val = Math.max(heightMap[i][j], Math.min(volume[i + 1][j], volume[i][j + 1]));
                    if (volume[i][j] > val) {
                        volume[i][j] = val;
                        upt = true;
                    }
                }
        }
        var res = 0;
        for (var i = 1; i < m - 1; i++)
            for (var j = 1; j < n - 1; j++) {
                var volVal = volume[i][j];
                var heightVal = heightMap[i][j];
                if (volVal > heightVal)
                    res += volVal - heightVal;
            }
        return res;
    }
}