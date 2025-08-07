class Solution {
    function maxCollectedFruits($fruits) {
        $n = count($fruits);
        // top-left diagonal
        $res = 0;
        for ($i = 0; $i < $n; $i++) {
            $res += $fruits[$i][$i];
        }
        // DP from top-right
        $dp1 = array_fill(0, $n, array_fill(0, $n, PHP_INT_MIN));
        $dp1[0][$n-1] = $fruits[0][$n-1];
        for ($x = 0; $x < $n; $x++) {
            for ($y = 0; $y < $n; $y++) {
                if ($x >= $y && !($x==$n-1 && $y==$n-1)) continue;
                foreach ([[1,-1],[1,0],[1,1]] as $d) {
                    $i = $x - $d[0];
                    $j = $y - $d[1];
                    if ($i<0||$i>=$n||$j<0||$j>=$n) continue;
                    // ensure region
                    if ($i < $j && $j < $n-1-$i) continue;
                    $dp1[$x][$y] = max($dp1[$x][$y], $dp1[$i][$j] + $fruits[$x][$y]);
                }
            }
        }
        $res += $dp1[$n-1][$n-1];
        // DP from bottom-left
        $dp2 = array_fill(0, $n, array_fill(0, $n, PHP_INT_MIN));
        $dp2[$n-1][0] = $fruits[$n-1][0];
        for ($y = 0; $y < $n; $y++) {
            for ($x = 0; $x < $n; $x++) {
                if ($x <= $y && !($x==$n-1 && $y==$n-1)) continue;
                foreach ([[-1,1],[0,1],[1,1]] as $d) {
                    $i = $x - $d[0];
                    $j = $y - $d[1];
                    if ($i<0||$i>=$n||$j<0||$j>=$n) continue;
                    if ($j < $i && $i < $n-1-$j) continue;
                    $dp2[$x][$y] = max($dp2[$x][$y], $dp2[$i][$j] + $fruits[$x][$y]);
                }
            }
        }
        $res += $dp2[$n-1][$n-1];
        // subtract double-counted bottom-right
        return $res - 2 * $fruits[$n-1][$n-1];
    }
}