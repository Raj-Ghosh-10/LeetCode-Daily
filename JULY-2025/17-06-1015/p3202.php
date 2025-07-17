class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $k
     * @return Integer
     */
    function maximumLength($nums, $k) {
        // Create a 2D array to store the frequency of valid subsequence of length i,
        // ending at index j with the remainder of (nums[$i] + nums[$j]) % $k as the key.
        $dp = array_fill(0, count($nums), array_fill(0, $k, 0));

        // Initialize the maximum length of valid subsequence to 0.
        $maximum = 0;

        // Iterate over the indices in reverse order.
        for ($i = count($nums) - 1; $i >= 0; $i--) {
            for ($j = $i + 1; $j < count($nums); $j++) {
                // Calculate the remainder of (nums[$i] + nums[$j]) % $k.
                $remainder = ($nums[$i] + $nums[$j]) % $k;
                // Increment the frequency of the valid subsequence by 1.
                $frequency = $dp[$j][$remainder] + 1;

                if ($dp[$i][$remainder] < $frequency) {
                    $dp[$i][$remainder] = $frequency;
                }

                $maximum = max($maximum, $frequency);
            }
        }

        return $maximum + 1;
    }
}