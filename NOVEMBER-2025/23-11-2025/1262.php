class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function maxSumDivThree($nums) {
        $sum = 0;

        $m1a = INF;  $m1b = INF;
        $m2a = INF;  $m2b = INF;

        foreach ($nums as $x) {
            $sum += $x;
            $r = $x % 3;

            if ($r == 1) {
                if ($x < $m1a) { $m1b = $m1a; $m1a = $x; }
                else if ($x < $m1b) $m1b = $x;
            }
            else if ($r == 2) {
                if ($x < $m2a) { $m2b = $m2a; $m2a = $x; }
                else if ($x < $m2b) $m2b = $x;
            }
        }

        $rem = $sum % 3;
        if ($rem == 0) return $sum;

        $remove = INF;

        if ($rem == 1) {
            $opt1 = $m1a;
            $opt2 = ($m2b < INF) ? $m2a + $m2b : INF;
            $remove = min($opt1, $opt2);
        } else {
            $opt1 = $m2a;
            $opt2 = ($m1b < INF) ? $m1a + $m1b : INF;
            $remove = min($opt1, $opt2);
        }

        return ($remove == INF) ? 0 : $sum - $remove;
    }
}