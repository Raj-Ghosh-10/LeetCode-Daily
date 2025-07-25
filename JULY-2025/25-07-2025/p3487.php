class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function maxSum($nums) {
        $map = [];
        $sum = 0;
        $maxN = -200;

        foreach ($nums as $value) {
            if (!in_array($value, $map)) {
                if ($value > 0) {
                    $map[] = $value;
                    $sum += $value;
                } else {
                    if ($value > $maxN)
                        $maxN = $value;
                }
            }
        }

        if ($sum == 0) return $maxN;
        else return $sum;
    }
}