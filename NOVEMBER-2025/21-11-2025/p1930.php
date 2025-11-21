class Solution {

    /**
     * @param String $s
     * @return Integer
     */
    function countPalindromicSubsequence($s) {
        $n = strlen($s);
        $first = array_fill(0, 26, -1);
        $last = array_fill(0, 26, -1);

        for ($i = 0; $i < $n; $i++) {
            $c = ord($s[$i]) - 97;
            if ($first[$c] == -1) $first[$c] = $i;
            $last[$c] = $i;
        }

        $ans = 0;

        for ($c = 0; $c < 26; $c++) {
            if ($first[$c] != -1 && $last[$c] - $first[$c] > 1) {
                $mask = 0;
                for ($i = $first[$c] + 1; $i < $last[$c]; $i++) {
                    $mask |= 1 << (ord($s[$i]) - 97);
                }
                $ans += substr_count(decbin($mask), '1');
            }
        }

        return $ans;
    }
}