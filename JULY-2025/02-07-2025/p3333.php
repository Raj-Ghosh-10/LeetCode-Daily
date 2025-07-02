class Solution {
private const MOD = 1000000007;
    /**
     * @param String $word
     * @param Integer $k
     * @return Integer
     */
    function possibleStringCount($word, $k) {
         $n = strlen($word);
        $groups = [];
        $len = 1;
 
        for ($i = 1; $i < $n; $i++) {
            if ($word[$i] === $word[$i - 1]) {
                $len++;
            } else {
                $groups[] = $len;
                $len = 1;
            }
        }
        $groups[] = $len;

        $total = 1;
        foreach ($groups as $g) {
            $total = ($total * $g) % self::MOD;
        }

        if (count($groups) >= $k) {
            return (int)$total;
        }

        $dp = array_fill(0, $k, 0);
        $prefix = array_fill(0, $k, 0);
        $dp[0] = 1;
        foreach (range(0, $k - 1) as $i) {
            $prefix[$i] = 1;
        }

        foreach ($groups as $groupLen) {
            $newDp = array_fill(0, $k, 0);
            for ($j = 1; $j < $k; $j++) {
                $newDp[$j] = $prefix[$j - 1];
                if ($j - $groupLen - 1 >= 0) {
                    $newDp[$j] = ($newDp[$j] - $prefix[$j - $groupLen - 1] + self::MOD) % self::MOD;
                }
            }

            $newPrefix = array_fill(0, $k, 0);
            $newPrefix[0] = $newDp[0];
            for ($j = 1; $j < $k; $j++) {
                $newPrefix[$j] = ($newPrefix[$j - 1] + $newDp[$j]) % self::MOD;
            }

            $dp = $newDp;
            $prefix = $newPrefix;
        }

        return (int)(($total - $prefix[$k - 1] + self::MOD) % self::MOD);
    }
    
}