class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $k
     * @return Integer
     */
    function maxSubarraySum($nums, $k) {
        $INF = PHP_INT_MAX;
        $minPrefix = array_fill(0, $k, $INF);
        $minPrefix[0] = 0;

        $prefix = 0;
        $answer = -PHP_INT_MAX;

        for ($i = 0; $i < count($nums); $i++) {
            $prefix += $nums[$i];
            $mod = ($i + 1) % $k;

            if ($minPrefix[$mod] != $INF) {
                $answer = max($answer, $prefix - $minPrefix[$mod]);
            }

            $minPrefix[$mod] = min($minPrefix[$mod], $prefix);
        }

        return $answer;
    }
}