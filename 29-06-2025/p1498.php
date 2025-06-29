class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer
     */
    function numSubseq($nums, $target) {
        sort($nums);
        $mod = 1e9 + 7;
        $n = count($nums);
        
        // Precompute powers of 2
        $pow = array_fill(0, $n, 1);
        for ($i = 1; $i < $n; $i++) {
            $pow[$i] = ($pow[$i - 1] * 2) % $mod;
        }

        $left = 0;
        $right = $n - 1;
        $res = 0;

        while ($left <= $right) {
            if ($nums[$left] + $nums[$right] <= $target) {
                $res = ($res + $pow[$right - $left]) % $mod;
                $left++;
            } else {
                $right--;
            }
        }

        return $res;
    }

}