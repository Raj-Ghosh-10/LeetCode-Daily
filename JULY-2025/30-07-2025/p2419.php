class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function longestSubarray($nums) {
        $max_value = max($nums);
        $max_length = 0;
        $current_length = 0;

        foreach ($nums as $num) {
            if ($num === $max_value) {
                $current_length += 1;
                $max_length = max($max_length, $current_length);
            } else {
                $current_length = 0;
            }
        }
        
        return $max_length;
    }
}