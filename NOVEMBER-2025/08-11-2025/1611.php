class Solution {
    public function minimumOneBitOperations($n) {
        $v = array_fill(0, 31, 0);
        $v[0] = 1;
        for ($i = 1; $i < 31; $i++) {
            $v[$i] = (2 * $v[$i - 1]) + 1;
        }

        $cnt = 0;
        $ans = 0;
        for ($i = 30; $i >= 0; $i--) {
            if ((1 << $i) & $n) {
                $cnt++;
                if ($cnt % 2) {
                    $ans += $v[$i];
                } else {
                    $ans -= $v[$i];
                }
            }
        }
        return $ans;
    }
}