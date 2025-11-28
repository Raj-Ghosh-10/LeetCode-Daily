class Solution {

    /**
     * @param Integer $n
     * @param Integer[][] $edges
     * @param Integer[] $values
     * @param Integer $k
     * @return Integer
     */
    function maxKDivisibleComponents($n, $edges, $values, $k) {
        $g = array_fill(0, $n, []);
        foreach ($edges as $e) {
            $a = $e[0];
            $b = $e[1];
            $g[$a][] = $b;
            $g[$b][] = $a;
        }

        $ans = 0;

        $dfs = function($u, $p) use (&$dfs, &$g, &$values, $k, &$ans) {
            $sum = $values[$u];
            foreach ($g[$u] as $v) {
                if ($v === $p) continue;
                $sum += $dfs($v, $u);
            }
            if ($sum % $k === 0) {
                $ans++;
                return 0;
            }
            return $sum;
        };

        $dfs(0, -1);
        return $ans;
    }
}