class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer[]
     */
    function smallestSubarrays($nums) {
         $length = count($nums);
    $lastSeen = array_fill(0, 30, 0);
    $result = array_fill(0, $length, 1);

    for ($i = $length - 1; $i >= 0; $i--) {
        for ($bit = 0; $bit < 30; $bit++) {
            if (($nums[$i] & (1 << $bit)) > 0) {
                $lastSeen[$bit] = $i;
            }
            $result[$i] = max($result[$i], $lastSeen[$bit] - $i + 1);
        }
    }

    return $result;
    }
}