class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $k
     * @return Integer
     */
    function minOperations($nums, $k) {
        return array_sum($nums) % $k;
    }
}