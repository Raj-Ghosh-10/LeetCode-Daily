class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function countMaxOrSubsets($nums) {
         $maxiOr = PHP_INT_MIN;
    $c = 0;
    $n = count($nums);

    for ($i = 1; $i < (1 << $n); $i++) {
        $or = 0;
        for ($j = 0; $j < $n; $j++) {
            if (($i & (1 << $j)) != 0) {
                $or |= $nums[$j];
            }
        }
        if ($or > $maxiOr) {
            $maxiOr = $or;
            $c = 0;
        }
        if ($or == $maxiOr) {
            $c += 1;
        }
    }
    return $c;
    }
}