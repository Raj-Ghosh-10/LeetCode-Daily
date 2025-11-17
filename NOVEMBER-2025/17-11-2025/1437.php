class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $k
     * @return Boolean
     */
    function kLengthApart($nums, $k) {
        $prev = -1;  // last seen index of 1
        foreach ($nums as $i => $val) {
            if ($val == 1) {
                if ($prev != -1 && ($i - $prev - 1) < $k) {
                    return false;
                }
                $prev = $i;
            }
        }
        return true;
    }
}