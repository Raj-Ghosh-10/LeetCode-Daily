class Solution {

    /**
     * @param Integer $n
     * @param Integer $x
     * @return Integer
     */
    function numberOfWays($n, $x) {
        $MOD = 1000000007;

     $dp = array_fill(0, $n + 1, 0);
    $dp[0] = 1;

     for ($i = 1; ; $i++) {
        $power = $this->pow_limited($i, $x, $n); 
        if ($power > $n) break;

         for ($s = $n; $s >= $power; $s--) {
            $dp[$s] = ($dp[$s] + $dp[$s - $power]) % $MOD;
        }
    }

    return $dp[$n];
    }

    function pow_limited(  $base,   $exp,   $limit) {
    $result = 1;
    for ($e = 0; $e < $exp; $e++) { 
        if ($base !== 0 && $result > intdiv($limit, $base)) {
            return $limit + 1; 
        }
        $result *= $base;
        if ($result > $limit) return $limit + 1;
    }
    return $result;
}
}